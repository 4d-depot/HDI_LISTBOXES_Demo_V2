C_TEXT:C284($Format)

Case of 
	: (<>_Unit=1)  // pixels
		$Format:="20;60;10;1;50;;"
		
		<>RowHeight:=(<>RowHeight*20)
		
	: (<>_Unit=2)  //
		$Format:="1;3;1;1;50;;"
		
		<>RowHeight:=Round:C94(<>RowHeight/20; 0)
		
End case 

OBJECT SET FORMAT:C236(*; "RowHeight"; $Format)
