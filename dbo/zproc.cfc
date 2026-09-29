component {

// .usr passes the id (varchar) now instead of usrid (integer)
// todo: No dataSource
// todo: No error trapping
function usr(proc,params,results,dataSource) {
	var result = 0
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
	var i = 0
	var errmsg = ''
	var processParams = false
	var response = {}

	if (IsDefined('params')) {
		if (IsSimpleValue(params)) {
			if (params == '') {
				processParams = false
			} else {
				processParams = true
			}
		} else {
			processParams = true
		}
	} else {
		processParams = false
	}

	if (processParams) {

		if (IsSimpleValue(params)) {

			cfstoredproc(procedure=arguments.proc) {

				cfprocparam(
					value=params,
					cfsqltype='cf_sql_varchar'
				)

				if (!results) {
				} else if (results == 1) {
					cfprocresult(name='response')
				} else {
					var response = ArrayNew(1)

					for (i=1; i<=results; i++) {
						cfprocresult(
							resultset=i,
							name='response[#i#]'
						)
					}
				}
			}

		} else if (IsArray(params)) {

			for (i=1; i<=ArrayLen(params); i++) {
				if (isNull(params[i])) {
					params[i] = -2147483648
				}
			}
			cfstoredproc(procedure=arguments.proc) {

				for (i=1; i<=ArrayLen(params); i++) {
					if (IsNumeric(params[i])) {
						cfprocparam(
							value=params[i],
							cfsqltype='cf_sql_integer'
						)
					} else {
						cfprocparam(
							value=params[i],
							cfsqltype='cf_sql_varchar'
						)
					}
				}

				if (!results) {
				} else if (results == 1) {
					cfprocresult(name='response')
				} else {
					var response = ArrayNew(1)

					for (i=1; i<=results; i++) {
						cfprocresult(
							resultset=i,
							name='response[#i#]'
						)
					}
				}
			}
		} else {

			cfstoredproc(procedure=arguments.proc) {

				cfprocparam(
					value=params.varchar,
					cfsqltype='cf_sql_varchar'
				)

				if (!results) {
				} else if (results == 1) {
					cfprocresult(name='response')
				} else {
					var response = ArrayNew(1)

					for (i=1; i<=results; i++) {
						cfprocresult(
							resultset=i,
							name='response[#i#]'
						)
					}
				}
			}
		}

	} else {

		cfstoredproc(procedure=arguments.proc) {

			if (!results) {
			} else if (results == 1) {
				cfprocresult(name='response')
			} else {
				var response = ArrayNew(1)

				for (i=1; i<=results; i++) {
					cfprocresult(
						resultset=i,
						name='response[#i#]'
					)
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