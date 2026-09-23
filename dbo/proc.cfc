component {

// .usr passes the id (varchar) now instead of usrid (integer)



















// todo: No dataSource
// todo: No error trapping
function usr(proc,params,results,dataSource) {
	var result
	param results=1;
	var arrParams = []
	if (IsDefined('arguments.params')) {
		if (IsArray(params)) {
			arrParams = params
			ArrayPrepend(arrParams,request.usr.id)
		} else {
			arrParams[1] = request.usr.id
			arrParams[2] = params
		}
	} else {
		arrParams = request.usr.id
	}
	if (results) {
		result = exec(proc,arrParams,results)
		return result
	} else {
		exec(proc,arrParams,0)
	}
}


function exec(proc,params,results,dataSource) {
	param results=1;
	var i=0
	var errmsg = ''
	var processParams
	
	if (IsDefined('params')) {
		if (IsSimpleValue(params)) {
			if (params == '') {
				processParams = false
			} else {
				processParams = true // 1 parameter
			}
		} else {
			processParams = true // multiple parameters or params.varchar
		}
	} else {
		processParams = false // default
	}
	//echo(proc & ' processParams: ' & processParams & '<br>')
	if (processParams) {
		//echo(proc & ' IsSimpleValue(params): ' & IsSimpleValue(params) & '<br>')
		if (IsSimpleValue(params)) {
			storedproc // datasource=request.datasource
				procedure=arguments.proc {
				procparam value=params;
				if (!results) {
				} else if (results == 1) {
					procresult name='response';
				} else {
					var response = ArrayNew(1)
					for (i=1; i<=results; i++) {
						procresult resultset=i name='response[#i#]';
					}
				}
			}
		} else if (IsArray(params)) {
			//echo('isarray: ' & proc)
			//abort;
			for (i=1; i<=ArrayLen(params); i++) {
				if (isNull(params[i])) {
					params[i] = -2147483648 // hack to use -2,147,483,648 for null
				}
			}
			storedproc // datasource=request.datasource
				procedure=arguments.proc {
				for (i=1; i<=ArrayLen(params); i++) {
					procparam value=params[i];
				}
				if (!results) {
				} else if (results == 1) {
					procresult name='response';
				} else {
					var response = ArrayNew(1)
					for (i=1; i<=results; i++) {
						procresult resultset=i name='response[#i#]';
					}
				}
			}
		} else {
			//echo(proc & ' and it is not an array<br>')
			//dump(params)
			storedproc // datasource=request.datasource
				procedure=arguments.proc {
				procparam value=params.varchar cfsqltype='cf_sql_varchar';
				if (!results) {
				} else if (results == 1) {
					procresult name='response';
				} else {
					var response = ArrayNew(1)
					for (i=1; i<=results; i++) {
						procresult resultset=i name='response[#i#]';
					}
				}
			}
		}
	} else {
		storedproc // datasource=request.datasource
			procedure=arguments.proc {
			if (!results) {
			} else if (results == 1) {
				procresult name='response';
			} else {
				var response = ArrayNew(1)
				for (i=1; i<=results; i++) {
					procresult resultset=i name='response[#i#]';
				}
			}
		}
	}
	if (Len(errmsg)) {
		echo(errmsg & '
</body>
</html>')
		abort;
	}
	if (results and IsDefined('response')) {
		return response
	}
}
}
