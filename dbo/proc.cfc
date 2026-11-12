component {
function usr(proc,params,datasource='lr2026Fall2') {
	var arrParams = []
	if (IsDefined('arguments.params') && !isEmptyParams(params)) {
		if (IsArray(params)) {
			arrParams = Duplicate(params)
		} else {
			ArrayAppend(arrParams,params)
		}
	}
	ArrayPrepend(arrParams,request.usr.id)
	return exec(proc,arrParams,datasource)
}
function exec(proc,params,datasource='lr2026Fall2') {
	var result = 0
	var arrParams = []
	var i = 0
	if (IsDefined('arguments.params') && !isEmptyParams(params)) {
		if (IsArray(params)) {
			arrParams = params
		} else {
			ArrayAppend(arrParams,params)
		}
	}
	cfstoredproc(procedure=proc, datasource=datasource) {
		for (i=1;i <= ArrayLen(arrParams);i++) {
			cfprocparam(value=arrParams[i], cfsqltype='cf_sql_varchar')
		}
		cfprocresult(name='result')
	}
	return result
}
private boolean function isEmptyParams(params) {
	if (IsArray(params)) {
		return !ArrayLen(params)
	}
	if (IsStruct(params)) {
		return StructIsEmpty(params)
	}
	return false
}
}
