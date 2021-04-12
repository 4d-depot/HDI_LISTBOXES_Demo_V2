C_LONGINT:C283($foregroundColor; $backgroundColor; $altBackgrndColor; $Color)

OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionHeader1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
$Color:=Select RGB color:C956
If (ok=1)
	$foregroundColor:=$Color
	OBJECT SET RGB COLORS:C628(*; "LB_DescriptionHeader@"; $foregroundColor; $backgroundColor; $altBackgrndColor)
	OBJECT SET RGB COLORS:C628(*; "Rectangle0"; 0; $foregroundColor)
End if 
