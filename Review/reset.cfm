<cfscript>
sql = '
delete from guess where guessid in(
    select guessid
    from guess
    join grade on guess_grade=gradeid
    where grade_usr=' & request.usr.usrid & '
    and grade_act=' & form.actid & '
)
delete from grade where grade_usr=' & request.usr.usrid & ' and grade_act=' & form.actid

queryExecute(sql)
location(request.dir & '?id=' & request.usr.id & '&actid=' & form.actid,false)
</cfscript>