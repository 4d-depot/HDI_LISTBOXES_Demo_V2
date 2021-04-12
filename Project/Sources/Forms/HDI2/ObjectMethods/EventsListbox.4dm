C_LONGINT:C283($Column; $Row)
C_BOOLEAN:C305($Option)

LISTBOX GET CELL POSITION:C971(*; "EventsListbox"; $Column; $Row)

If (Macintosh option down:C545)
	$Option:=True:C214
Else 
	$Option:=False:C215
End if 

Case of 
		
	: (Form event code:C388=On Expand:K2:41)  //== on expand
		
		ExpandRowCol("EventsListbox"; $Row; $Column; $Option)
		Form:C1466.nbRows2:=Size of array:C274(<>_Tracks)
		
	: (Form event code:C388=On Collapse:K2:42)
		
		CollapseRowCol("EventsListbox"; $Row; $Column; $Option)
		Form:C1466.nbRows2:=Size of array:C274(<>_Tracks)
		
End case 