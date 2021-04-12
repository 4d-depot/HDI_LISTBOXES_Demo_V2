C_LONGINT:C283($foregroundColor; $backgroundColor; $altBackgrndColor; $Color)

OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionColumn1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
$Color:=Select RGB color:C956($backgroundColor)
If (ok=1)
	$backgroundColor:=$Color
	OBJECT SET RGB COLORS:C628(*; "LB_DescriptionColumn@"; $foregroundColor; $backgroundColor; $altBackgrndColor)
	OBJECT SET RGB COLORS:C628(*; "Rectangle2"; 0; $backgroundColor)
End if 
