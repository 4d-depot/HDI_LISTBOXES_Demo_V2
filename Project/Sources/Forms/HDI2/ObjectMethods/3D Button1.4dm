
C_LONGINT:C283($GridColorH; $GridColorV)
LISTBOX GET GRID COLORS:C1200(*; "LB_Description"; $GridColorH; $GridColorV)

$GridColorH:=Select RGB color:C956($GridColorH)
If (ok=1)
	LISTBOX SET GRID COLOR:C842(*; "LB_Description"; $GridColorH; True:C214; False:C215)
	OBJECT SET RGB COLORS:C628(*; "Rectangle6"; 0; $GridColorH)
End if 

