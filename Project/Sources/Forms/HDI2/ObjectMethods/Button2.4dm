C_TEXT:C284($ListName)
C_TEXT:C284($Content)

$ListName:=<>_ColumnChoice{<>_ColumnChoice}

If (<>_ContentChoice=1)
	$Content:=""
Else 
	$Content:=<>_ContentChoice{<>_ContentChoice}
End if 

OBJECT SET LIST BY NAME:C237(*; $ListName; $Content)

