C_LONGINT:C283($x; $y)
C_TEXT:C284($MenuChoice)

Case of 
	: (Form event code:C388=On Footer Click:K2:55)
		
		// 1
		
		$MenuChoice:=Dynamic pop up menu:C1006(Form:C1466.contentMenu)
		
		Case of 
			: ($MenuChoice="Artists")
				
				SET MENU ITEM MARK:C208(Form:C1466.contentMenu; 1; Char:C90(18))
				SET MENU ITEM MARK:C208(Form:C1466.contentMenu; 2; "")
				
				OBJECT SET VISIBLE:C603(*; "Albums"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Artists"; True:C214)
				
			: ($MenuChoice="Albums")
				
				SET MENU ITEM MARK:C208(Form:C1466.contentMenu; 1; "")
				SET MENU ITEM MARK:C208(Form:C1466.contentMenu; 2; Char:C90(18))
				
				OBJECT SET VISIBLE:C603(*; "Albums"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Artists"; False:C215)
				
		End case 
		
End case 
