
C_LONGINT:C283($GridColorH; $GridColorV)
LISTBOX GET GRID COLORS:C1200(*; "LB_Description"; $GridColorH; $GridColorV)

$GridColorV:=Select RGB color:C956($GridColorV)
If (ok=1)
	LISTBOX SET GRID COLOR:C842(*; "LB_Description"; $GridColorV; False:C215; True:C214)
	OBJECT SET RGB COLORS:C628(*; "Rectangle7"; 0; $GridColorV)
End if 

