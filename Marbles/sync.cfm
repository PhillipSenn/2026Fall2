<cfscript>
setting showdebugoutput=false;
cfcontent(reset=true, type="application/json");
param name="form.op" default="poll";
param name="form.layout" default="";
param name="form.scores" default="";
param name="form.shotNo" default="0";
param name="form.shooter" default="";

function marblesGame() {
	if (!structKeyExists(application, 'marbles')) {
		application.marbles = {
			status: 'idle',
			shotNo: 0,
			lastShooter: '',
			marbles: '',
			shot: '',
			scores: '',
			movedAt: now()
		};
	}
	if (!structKeyExists(application.marbles, 'movedAt') || !isDate(application.marbles.movedAt)) {
		application.marbles.movedAt = now();
	}
	return application.marbles;
}

function closeStaleShot(game) {
	if (game.status != 'rolling') {
		return;
	}
	if (structKeyExists(game, 'shotAt') && isDate(game.shotAt) && dateDiff('s', game.shotAt, now()) < 30) {
		return;
	}
	game.status = 'idle';
}

function marblesPayload(game, accepted) {
	var idleFor = 0;
	if (structKeyExists(game, 'movedAt') && isDate(game.movedAt)) {
		idleFor = dateDiff('s', game.movedAt, now());
	}
	return {
		accepted: accepted,
		status: game.status,
		shotNo: game.shotNo,
		lastShooter: game.lastShooter,
		marbles: game.marbles,
		shot: game.shot,
		scores: game.scores,
		idleFor: idleFor
	};
}
</cfscript>

<cflock scope="application" type="exclusive" timeout="5">
	<cfset game = marblesGame()>
	<cfset closeStaleShot(game)>
</cflock>

<cfif form.op eq "poll">
	<cflock scope="application" type="readonly" timeout="5">
		<cfset payload = marblesPayload(application.marbles, true)>
	</cflock>
<cfelse>
	<cflock scope="application" type="exclusive" timeout="5">
		<cfscript>
			game = application.marbles;
			closeStaleShot(game);
			accepted = true;
			if (form.op == 'init') {
				fresh = val(game.shotNo) == 0 && !len(game.marbles);
				replaceLayout = false;
				if (len(game.marbles) && len(form.layout)) {
					try {
						replaceLayout = arrayLen(deserializeJSON(game.marbles)) != arrayLen(deserializeJSON(form.layout));
					} catch (any ignore) {
						replaceLayout = false;
					}
				}
				if (fresh || replaceLayout) {
					if (replaceLayout) {
						game.shotNo = 0;
						game.status = 'idle';
						game.lastShooter = '';
						game.shot = '';
					}
					game.marbles = form.layout;
					game.scores = form.scores;
					game.movedAt = now();
				}
			} else if (form.op == 'shot') {
				if (game.status != 'idle') {
					accepted = false;
				} else {
					game.shotNo = val(game.shotNo) + 1;
					game.status = 'rolling';
					game.lastShooter = request.usr.id;
					game.shot = form.layout;
					game.shotAt = now();
					game.movedAt = now();
				}
			} else if (form.op == 'settle') {
				if (val(form.shotNo) == val(game.shotNo)) {
					game.marbles = form.layout;
					game.scores = form.scores;
					game.status = 'idle';
					game.movedAt = now();
				} else {
					accepted = false;
				}
			}
			payload = marblesPayload(game, accepted);
		</cfscript>
	</cflock>
</cfif>

<cfoutput>#serializeJSON(payload)#</cfoutput>
