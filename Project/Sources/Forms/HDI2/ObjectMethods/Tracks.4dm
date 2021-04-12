C_LONGINT:C283($x; $y)
C_TEXT:C284($choice)

Case of 
	: (Form event code:C388=On Footer Click:K2:55)
		
		$choice:=Dynamic pop up menu:C1006(Form:C1466.calculationMenu)
		
		OBJECT SET FORMAT:C236(*; "TimeFooter"; String:C10(HH MM SS:K7:1))  // for 4 first cases
		Case of 
			: ($choice="Average")
				<>Footer2:=Get localized string:C991("Calc_Average")+<>Colon
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer average:K70:6)
			: ($choice="Maximum")
				<>Footer2:=Get localized string:C991("Calc_Maximum")+<>Colon
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer max:K70:3)
			: ($choice="Minimum")
				<>Footer2:=Get localized string:C991("Calc_Minimum")+<>Colon
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer min:K70:2)
			: ($choice="Sum")
				<>Footer2:=Get localized string:C991("Calc_Sum")+<>Colon
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer sum:K70:4)
			: ($choice="Count")
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer count:K70:5)
				OBJECT SET FORMAT:C236(*; "TimeFooter"; "###,###,##0")
				
				
		End case 
		
End case 
