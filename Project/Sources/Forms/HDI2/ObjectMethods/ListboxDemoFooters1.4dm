C_POINTER:C301($Ptr)

Case of 
	: (Form event code:C388=On Header Click:K2:40)
		
		$Ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		
		OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[3])
		OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.blue[3])
		OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[3])
		OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[3])
		
		Case of 
			: ($ptr=->Header1)
				OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[1])
			: ($ptr=->Header2)
				OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.blue[1])
			: ($ptr=->Header3)
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[1])
			: ($ptr=->Header4)
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[1])
		End case 
		
End case 