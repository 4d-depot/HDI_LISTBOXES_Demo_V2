C_TEXT:C284($menu)
C_TEXT:C284($choice)

Case of 
	: (Form event code:C388=On Footer Click:K2:55)
		
		
		$choice:=Dynamic pop up menu:C1006(Form:C1466.calculationMenu)
		
		If ($choice#"")
			
			OBJECT SET VALUE:C1742("LB_EntSelection_Footer3"; $choice+": ")
			
			OBJECT SET FORMAT:C236(*; "LB_EntSelection_Footer4"; Char:C90(HH MM SS:K7:1))
			Case of 
				: ($choice="Sum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_EntSelection_Footer4"; lk footer sum:K70:4)
				: ($choice="Minimum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_EntSelection_Footer4"; lk footer min:K70:2)
				: ($choice="Maximum")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_EntSelection_Footer4"; lk footer max:K70:3)
				: ($choice="Average")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_EntSelection_Footer4"; lk footer average:K70:6)
					
					
				: ($choice="Count")
					LISTBOX SET FOOTER CALCULATION:C1140(*; "LB_EntSelection_Footer4"; lk footer count:K70:5)
					//OBJECT SET FORMAT(*; "LB_EntSelection_Footer4"; Char(HH MM))
					OBJECT SET FORMAT:C236(*; "LB_EntSelection_Footer4"; "###,###,##0")
					
			End case 
			
		End if 
		
End case 
