C_LONGINT:C283($Align)

Case of 
	: (<>_Vposition=1)
		$Align:=Align top:K42:5
	: (<>_Vposition=2)
		$Align:=Align center:K42:3
	: (<>_Vposition=3)
		$Align:=Align bottom:K42:6
End case 

Case of 
	: (<>_ApplyTo=1)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Head_@"; $Align)
		
	: (<>_ApplyTo=2)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Column_@"; $Align)
		
	: (<>_ApplyTo=3)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Footer_@"; $Align)
		
	: (<>_ApplyTo=4)
		
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Head_@"; $Align)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Column_@"; $Align)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*; "Footer_@"; $Align)
		
End case 
