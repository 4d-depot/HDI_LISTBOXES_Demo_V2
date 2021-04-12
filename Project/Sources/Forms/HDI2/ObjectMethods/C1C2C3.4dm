C_BOOLEAN:C305($Enterable)
C_LONGINT:C283($Column; $Row)

Case of 
	: (Form event code:C388=On Before Data Entry:K2:39)
		
		LISTBOX GET CELL POSITION:C971(*; "ListboxDemoLockCells"; $Column; $Row)
		$Enterable:=True:C214  // default is ENTERABLE
		
		If ($Row>0)
			If (<>RawLock{$Row}=True:C214)
				ALERT:C41("This row is locked !")
				$Enterable:=False:C215
			Else 
				Case of 
					: ($Column=1)
						If (<>_Tracks{$Row}#"")
							ALERT:C41("This cell is locked !")  //∆∆∆
							$Enterable:=False:C215
						End if 
					: ($Column=2)
						If (<>_Artists{$Row}#"")
							ALERT:C41("This cell is locked !")  //∆∆∆
							$Enterable:=False:C215
						End if 
					: ($Column=3)
						If (<>_TracksDurations{$Row}#0)
							ALERT:C41("This cell is locked !")  //∆∆∆
							$Enterable:=False:C215
						End if 
				End case 
			End if 
		End if 
		
		If ($Enterable=False:C215)
			$0:=-1
		Else 
			$0:=0
		End if 
		
End case 


