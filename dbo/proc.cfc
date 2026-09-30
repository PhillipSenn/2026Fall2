component {

function usr(proc,params) {
	var arrParams = []

	if (IsDefined('arguments.params')) {
		if (IsArray(params)) {
			arrParams = Duplicate(params)
		} else {
			ArrayAppend(arrParams,params)
		}
	}

	ArrayPrepend(arrParams,request.usr.id)

	return exec(proc,arrParams)
}


function exec(proc,params) {
	var result = 0
	var arrParams = []
	var i = 0

	if (IsDefined('arguments.params')) {
		if (IsArray(params)) {
			arrParams = params
		} else {
			ArrayAppend(arrParams,params)
		}
	}

	cfstoredproc(procedure=proc) {
		for (i=1;i <= ArrayLen(arrParams);i++) {
			cfprocparam(value=arrParams[i],	cfsqltype='cf_sql_varchar')
		}

		cfprocresult(name='result')
	}

	return result
}

}