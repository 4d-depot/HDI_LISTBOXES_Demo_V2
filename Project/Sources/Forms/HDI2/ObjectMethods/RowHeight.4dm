C_LONGINT:C283($Unit)

If (<>_Unit=1)
	$Unit:=lk pixels:K53:22
Else 
	$Unit:=lk lines:K53:23
End if 

Case of 
	: (<>_ApplyTo=1)
		LISTBOX SET HEADERS HEIGHT:C1143(*; "HeightDemoListBox"; <>RowHeight; $Unit)
		
	: (<>_ApplyTo=2)
		LISTBOX SET ROWS HEIGHT:C835(*; "HeightDemoListBox"; <>RowHeight; $Unit)
		
	: (<>_ApplyTo=3)
		LISTBOX SET FOOTERS HEIGHT:C1145(*; "HeightDemoListBox"; <>RowHeight; $Unit)
		
	: (<>_ApplyTo=4)
		LISTBOX SET HEADERS HEIGHT:C1143(*; "HeightDemoListBox"; <>RowHeight; $Unit)
		LISTBOX SET ROWS HEIGHT:C835(*; "HeightDemoListBox"; <>RowHeight; $Unit)
		LISTBOX SET FOOTERS HEIGHT:C1145(*; "HeightDemoListBox"; <>RowHeight; $Unit)
End case 