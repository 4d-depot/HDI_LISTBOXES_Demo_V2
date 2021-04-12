C_LONGINT:C283($Align)

Case of 
	: (<>_Hposition=1)
		$Align:=Align left:K42:2
	: (<>_Hposition=2)
		$Align:=Align center:K42:3
	: (<>_Hposition=3)
		$Align:=Align right:K42:4
End case 

Case of 
	: (<>_ApplyTo=1)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Head_@"; $Align)
		
	: (<>_ApplyTo=2)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Column_@"; $Align)
		
	: (<>_ApplyTo=3)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Footer_@"; $Align)
		
	: (<>_ApplyTo=4)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Head_@"; $Align)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Column_@"; $Align)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*; "Footer_@"; $Align)
		
End case 