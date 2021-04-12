C_TEXT:C284($Info)

SET TIMER:C645(0)

If (Form:C1466.functionIndex>0)
	
	Form:C1466.currentPage:=Form:C1466.functionIndex
	
	FORM GOTO PAGE:C247(Form:C1466.currentPage)
	GOTO OBJECT:C206(OBJECT Get pointer:C1124(Object current:K67:2)->)
	
	$Info:="TextInfos_"+String:C10(Form:C1466.currentPage)
	Form:C1466.info:=Get localized string:C991($Info)
	
End if 

SET TIMER:C645(-1)