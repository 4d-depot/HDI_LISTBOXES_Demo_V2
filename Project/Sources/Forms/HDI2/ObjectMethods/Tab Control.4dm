Case of 
	: (TC2=1)
		OBJECT SET VISIBLE:C603(*; "LB_ModeArray@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "LB_ModeSelection@"; False:C215)
		
		Form:C1466.infoSuite:=Get localized string:C991("TextInfos_2a")
		
	: (TC2=2)
		OBJECT SET VISIBLE:C603(*; "LB_ModeArray@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "LB_ModeSelection@"; True:C214)
		
		Form:C1466.infoSuite:=Get localized string:C991("TextInfos_2b")
End case 