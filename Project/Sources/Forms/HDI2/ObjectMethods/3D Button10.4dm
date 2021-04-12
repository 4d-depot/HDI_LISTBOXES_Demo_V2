C_LONGINT:C283($foregroundColor; $backgroundColor; $altBackgrndColor; $Color)

OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionFooter1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
$Color:=Select RGB color:C956($foregroundColor)
If (ok=1)
	$foregroundColor:=$Color
	OBJECT SET RGB COLORS:C628(*; "LB_DescriptionFooter@"; $foregroundColor; $backgroundColor; $altBackgrndColor)
	OBJECT SET RGB COLORS:C628(*; "Rectangle4"; 0; $foregroundColor)
End if 
