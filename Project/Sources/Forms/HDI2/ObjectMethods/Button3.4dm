Case of 
		
	: (OBJECT Get value:C1743("rbAction1")=1)
		LISTBOX INSERT ROWS:C913(*; "C1C2C3"; Form:C1466.rowNum+1; Form:C1466.nbLines)
		
	: (OBJECT Get value:C1743("rbAction2")=1)
		LISTBOX DELETE ROWS:C914(*; "C1C2C3"; Form:C1466.rowNum+1; Form:C1466.nbLines)
		
End case 