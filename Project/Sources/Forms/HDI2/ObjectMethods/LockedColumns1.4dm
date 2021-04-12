C_LONGINT:C283($i)
C_LONGINT:C283($Foreground; $Background)
C_TEXT:C284($objectname)

LISTBOX SET STATIC COLUMNS:C1153(*; "HeightDemoLockCols"; Form:C1466.staticColumns)
LISTBOX SET LOCKED COLUMNS:C1151(*; "HeightDemoLockCols"; Form:C1466.lockedColumns)

For ($i; 1; 10)
	$objectname:="P4_Col"+String:C10($i)
	
	If ($i<=Form:C1466.staticColumns)
		$Foreground:=0x00D00000
	Else 
		$Foreground:=0
	End if 
	
	If ($i<=Form:C1466.lockedColumns)
		$Background:=Form:C1466.blue[1]
	Else 
		$Background:=Form:C1466.yellow[3]
	End if 
	
	OBJECT SET RGB COLORS:C628(*; $objectname; $Foreground; $Background)
End for 

Case of 
	: (Form:C1466.staticColumns=0)
		Form:C1466.infoStatic:=Get localized string:C991("StaticInfos0")
	: (Form:C1466.staticColumns=1)
		Form:C1466.infoStatic:=Get localized string:C991("StaticInfos1")
	Else 
		Form:C1466.infoStatic:=Get localized string:C991("StaticInfos2")
		Form:C1466.infoStatic:=Replace string:C233(Form:C1466.infoStatic; "<n>"; String:C10(Form:C1466.staticColumns))
End case 

Case of 
	: (Form:C1466.lockedColumns=0)
		Form:C1466.infoLocked:=Get localized string:C991("LockInfos0")
	: (Form:C1466.lockedColumns=1)
		Form:C1466.infoLocked:=Get localized string:C991("LockInfos1")
	Else 
		Form:C1466.infoLocked:=Get localized string:C991("LockInfos2")
		Form:C1466.infoLocked:=Replace string:C233(Form:C1466.infoLocked; "<n>"; String:C10(Form:C1466.lockedColumns))
End case 


