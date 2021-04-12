C_TEXT:C284($menu)
C_TEXT:C284($choice)

Case of 
	: (Form event code:C388=On Footer Click:K2:55)
		
		$choice:=Dynamic pop up menu:C1006(Form:C1466.calculationMenu)
		
		If ($choice#"")
			
			OBJECT SET VALUE:C1742("LB_Collection_Footer3"; $choice+": ")
			
			//OBJECT SET FORMAT(*; "LB_Collection_Footer4"; Char(HH MM SS))  // for 4 first cases
			Case of 
				: ($choice="Sum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_Collection_Footer4"; lk footer sum:K70:4)
				: ($choice="Minimum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_Collection_Footer4"; lk footer min:K70:2)
				: ($choice="Maximum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_Collection_Footer4"; lk footer max:K70:3)
				: ($choice="Average")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_Collection_Footer4"; lk footer average:K70:6)
					
					//: ($choice="Count")
					//LISTBOX SET FOOTER CALCULATION(*; "LB_Collection_Footer4"; lk footer count)
					//OBJECT SET FORMAT(*; "LB_Collection_Footer4"; "###,###,##0")
					////OBJECT SET FORMAT(*; "LB_Collection_Footer4"; Char(HH MM))
			End case 
			
		End if 
		
End case 
