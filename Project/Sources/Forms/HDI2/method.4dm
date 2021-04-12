//Modifiée par RL le  12 juillet 2010
//Suppression du SVG dans la liste des codecs //∆∆∆

C_LONGINT:C283(GridHideH; GridHideV; ScrollHideH; ScrollHideV)

C_COLLECTION:C1488($get)
C_OBJECT:C1216($formula)

C_LONGINT:C283($i; $p; $n)
C_LONGINT:C283($foregroundColor; $backgroundColor; $altBackgrndColor)
C_LONGINT:C283($GridColorH; $GridColorV)
C_BOOLEAN:C305($GridScrollH; $GridScrollV)
C_BOOLEAN:C305($GridH; $GridV)

C_TEXT:C284($resname)
C_TEXT:C284($Info)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		//initialisation générale
		//INACTIVER LIGNE MENU(2;0)  `edit
		//INACTIVER LIGNE MENU(3;0)  `mode
		
		Form:C1466.blue:=New collection:C1472(0x00A2BFFF; 0x00B9D1FF; 0x00D0E1FF; 0x00DDEAFF; 0x00ECF3FF)
		Form:C1466.yellow:=New collection:C1472(0x00FFDC9D; 0x00FFE6B7; 0x00FFEDCE; 0x00FFF2DC; 0x00FFF5E5; 0x00FFF7EC)
		
		// left side listbox to select page
		
		Form:C1466.functions:=New collection:C1472()
		Form:C1466.functions.push(Get localized string:C991("Page0_Description"))
		Form:C1466.functions.push(Get localized string:C991("Page0_ArraysAndReccords"))
		Form:C1466.functions.push(Get localized string:C991("Page0_SynchronizedOrHierarchical"))
		Form:C1466.functions.push(Get localized string:C991("Page0_Footers"))
		Form:C1466.functions.push(Get localized string:C991("Page0_ChoiceLists"))
		Form:C1466.functions.push(Get localized string:C991("Page0_Events"))
		Form:C1466.functions.push(Get localized string:C991("Page0_HeightsAndAlignments"))
		Form:C1466.functions.push(Get localized string:C991("Page0_LockedColumns"))
		Form:C1466.functions.push(Get localized string:C991("Page0_LockedCells"))
		Form:C1466.functions.push(Get localized string:C991("Page0_MultiSyle"))
		
		Form:C1466.functions.push(Get localized string:C991("Page0_Collections"))
		Form:C1466.functions.push(Get localized string:C991("Page0_EntitySelection"))
		
		// menus used in page 4
		
		Form:C1466.calculationMenu:=Create menu:C408
		APPEND MENU ITEM:C411(Form:C1466.calculationMenu; Get localized string:C991("Calc_Average"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.calculationMenu; -1; "Average")
		APPEND MENU ITEM:C411(Form:C1466.calculationMenu; Get localized string:C991("Calc_Maximum"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.calculationMenu; -1; "Maximum")
		APPEND MENU ITEM:C411(Form:C1466.calculationMenu; Get localized string:C991("Calc_Minimum"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.calculationMenu; -1; "Minimum")
		APPEND MENU ITEM:C411(Form:C1466.calculationMenu; Get localized string:C991("Calc_Sum"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.calculationMenu; -1; "Sum")
		//APPEND MENU ITEM(Form.calculationMenu; Get localized string("Calc_Count"))
		//SET MENU ITEM PARAMETER(Form.calculationMenu; -1; "Count")
		
		Form:C1466.contentMenu:=Create menu:C408
		APPEND MENU ITEM:C411(Form:C1466.contentMenu; Get localized string:C991("Artists"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.contentMenu; -1; "Artists")
		SET MENU ITEM MARK:C208(Form:C1466.contentMenu; -1; Char:C90(18))
		APPEND MENU ITEM:C411(Form:C1466.contentMenu; Get localized string:C991("Albums"))
		SET MENU ITEM PARAMETER:C1004(Form:C1466.contentMenu; -1; "Albums")
		SET MENU ITEM MARK:C208(Form:C1466.contentMenu; -1; "")
		
		<>Colon:=Get localized string:C991("Calc_Colon")
		
		GOTO OBJECT:C206(*; "LB_Functions")
		
		Form:C1466.init:=True:C214
		Form:C1466.currentPage:=15
		FORM GOTO PAGE:C247(Form:C1466.currentPage)  // empty page
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$Info:="TextInfos_"+String:C10(Form:C1466.currentPage)
		Form:C1466.info:=Get localized string:C991($Info)
		
		Case of 
				
			: (Form:C1466.currentPage=1)  //----------- description ---------------------------------------------------------
				
				vTime:=?27:20:24?
				
				C_LONGINT:C283(LB_DescriptionFooter1)
				C_TIME:C306(LB_DescriptionFooter2)
				
				ARRAY REAL:C219(LB_DescriptionColumn1; 20)  //numbers
				ARRAY LONGINT:C221(LB_DescriptionColumn2; 20)  // durations
				For ($i; 1; 20; 1)
					LB_DescriptionColumn1{$i}:=Random:C100*Random:C100/100
					LB_DescriptionColumn2{$i}:=3600+(Random:C100%3600)
				End for 
				
				
				// OBJECT SET RGB COLORS(*;"LB_DescriptionColumn1";0;Form.blue[1];Form.blue[2])
				OBJECT SET RGB COLORS:C628(*; "LB_DescriptionColumn@"; 0; Form:C1466.yellow[3]; Form:C1466.yellow[4])
				OBJECT SET RGB COLORS:C628(*; "LB_DescriptionFooter@"; 0; Form:C1466.yellow[0]; Form:C1466.yellow[0])
				
				
				OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionHeader1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
				OBJECT SET RGB COLORS:C628(*; "Rectangle0"; 0; $foregroundColor; 0)
				
				OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionColumn1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
				
				OBJECT SET RGB COLORS:C628(*; "Rectangle1"; 0; $foregroundColor; 0)
				OBJECT SET RGB COLORS:C628(*; "Rectangle2"; 0; $backgroundColor; 0)
				OBJECT SET RGB COLORS:C628(*; "Rectangle3"; 0; $altBackgrndColor; 0)
				
				OBJECT GET RGB COLORS:C1074(*; "LB_DescriptionFooter1"; $foregroundColor; $backgroundColor; $altBackgrndColor)
				
				OBJECT SET RGB COLORS:C628(*; "Rectangle4"; 0; $foregroundColor; 0)
				OBJECT SET RGB COLORS:C628(*; "Rectangle5"; 0; $backgroundColor; 0)
				
				
				LISTBOX GET GRID:C1199(*; "LB_Description"; $GridH; $GridV)
				GridHideH:=1-Num:C11($GridH)
				GridHideV:=1-Num:C11($GridV)
				
				LISTBOX GET GRID COLORS:C1200(*; "LB_Description"; $GridColorH; $GridColorV)
				OBJECT SET RGB COLORS:C628(*; "Rectangle6"; 0; $GridColorH)
				OBJECT SET RGB COLORS:C628(*; "Rectangle7"; 0; $GridColorV)
				
				
				OBJECT GET SCROLLBAR:C1076(*; "LB_Description"; $GridScrollH; $GridScrollV)
				ScrollHideH:=1-Num:C11($GridScrollH)
				ScrollHideV:=1-Num:C11($GridScrollV)
				
				
			: (Form:C1466.currentPage=2)  //----------- arrays VS Selections ---------------------------------------------------------
				
				ARRAY TEXT:C222(TC2; 2)
				TC2{1}:=Get localized string:C991("Arrays")
				TC2{2}:=Get localized string:C991("Records")
				TC2:=1
				Form:C1466.infoSuite:=Get localized string:C991("TextInfos_2a")
				
				OBJECT SET VISIBLE:C603(*; "LB_ModeArray"; True:C214)
				OBJECT SET VISIBLE:C603(*; "LB_ModeSelection"; False:C215)
				
				RandomFillArrays
				ALL RECORDS:C47([tracks:5])
				
				OBJECT SET RGB COLORS:C628(*; "ArrayModeArtists"; 0; Form:C1466.blue[0]; Form:C1466.blue[1])
				OBJECT SET RGB COLORS:C628(*; "ArrayModeAlbums"; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
				OBJECT SET RGB COLORS:C628(*; "ArrayModeTracks"; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(*; "ArrayModeDurations"; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				
				OBJECT SET RGB COLORS:C628(*; "SelectionModeArtists"; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
				OBJECT SET RGB COLORS:C628(*; "SelectionModeDurations"; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				
			: (Form:C1466.currentPage=3)  //----------- Flat VS Hierachical ---------------------------------------------------------
				
				OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
				OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.yellow[1]; Form:C1466.yellow[2])
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.yellow[2]; Form:C1466.yellow[3])
				
				RandomFillArrays(2)
				
				SORT ARRAY:C229(<>_Artists; <>_Albums; <>_Tracks)
				ARRAY TEXT:C222(TC3; 2)
				TC3{1}:=Get localized string:C991("Synchronized")
				TC3{2}:=Get localized string:C991("Hierarchical")
				TC3:=1
				
			: (Form:C1466.currentPage=4)  //-----------  HEADERS and FOOTERS ----------------------------------------------------------------
				
				RandomFillArrays
				
				OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				
				C_TIME:C306(<>TimeFooter)
				
				<>Footer1:=Get localized string:C991("Artists")+"/"+Get localized string:C991("Albums")
				<>Footer2:=Get localized string:C991("Calc_Average")+<>Colon
				LISTBOX SET FOOTER CALCULATION:C1140(*; "TimeFooter"; lk footer average:K70:6)
				
			: (Form:C1466.currentPage=5)  //--------------------- Énumérations ---------------------------------------------------------
				
				OBJECT SET RGB COLORS:C628(*; "C1C2C3"; 0x00050505; Form:C1466.yellow[2]; Form:C1466.yellow[4])
				
				
				ARRAY TEXT:C222($_t1; 0)
				ARRAY TEXT:C222($_t2; 0)
				ARRAY TEXT:C222($_t3; 0)
				
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_1"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_2"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_3"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_4"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_5"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_6"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_7"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_8"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_9"))
				APPEND TO ARRAY:C911($_t1; Get localized string:C991("Color_10"))
				
				APPEND TO ARRAY:C911($_t2; Get localized string:C991("Shape_1"))
				APPEND TO ARRAY:C911($_t2; Get localized string:C991("Shape_2"))
				APPEND TO ARRAY:C911($_t2; Get localized string:C991("Shape_3"))
				APPEND TO ARRAY:C911($_t2; Get localized string:C991("Shape_4"))
				APPEND TO ARRAY:C911($_t2; Get localized string:C991("Shape_5"))
				
				APPEND TO ARRAY:C911($_t3; Get localized string:C991("Material_1"))
				APPEND TO ARRAY:C911($_t3; Get localized string:C991("Material_2"))
				APPEND TO ARRAY:C911($_t3; Get localized string:C991("Material_3"))
				APPEND TO ARRAY:C911($_t3; Get localized string:C991("Material_4"))
				APPEND TO ARRAY:C911($_t3; Get localized string:C991("Material_5"))
				
				ARRAY TO LIST:C287($_t1; "Colors")
				ARRAY TO LIST:C287($_t2; "Shapes")
				ARRAY TO LIST:C287($_t3; "Material")
				
				
				ARRAY TEXT:C222(<>_ContentChoice; 0)
				APPEND TO ARRAY:C911(<>_ContentChoice; Get localized string:C991("None"))
				APPEND TO ARRAY:C911(<>_ContentChoice; Get localized string:C991("Colors"))
				APPEND TO ARRAY:C911(<>_ContentChoice; Get localized string:C991("Shapes"))
				APPEND TO ARRAY:C911(<>_ContentChoice; Get localized string:C991("Material"))
				<>_ContentChoice:=2
				
				ARRAY TEXT:C222(<>_ColumnChoice; 0)
				APPEND TO ARRAY:C911(<>_ColumnChoice; "C1")
				APPEND TO ARRAY:C911(<>_ColumnChoice; "C2")
				APPEND TO ARRAY:C911(<>_ColumnChoice; "C3")
				<>_ColumnChoice:=1
				
				OBJECT SET VALUE:C1742("rbAction1"; 1)
				OBJECT SET VALUE:C1742("rbAction2"; 0)
				
				Form:C1466.nbLines:=5
				Form:C1466.rowNum:=5
				
				// columns of the listbox itself
				ARRAY TEXT:C222(<>_Colors; 5)
				ARRAY TEXT:C222(<>_Shapes; 5)
				ARRAY TEXT:C222(<>_Material; 5)
				
				For ($i; 1; 5)
					<>_Colors{$i}:=$_t1{(Random:C100%Size of array:C274($_t1))+1}
					<>_Shapes{$i}:=$_t2{(Random:C100%Size of array:C274($_t2))+1}
					<>_Material{$i}:=$_t3{(Random:C100%Size of array:C274($_t3))+1}
				End for 
				
				
			: (Form:C1466.currentPage=6)  //-----------  EVENTS (collapse / expand) ----------------------------------------------------------------
				
				ARRAY TEXT:C222(<>_Styles; 0)
				ARRAY TEXT:C222(<>_Artists; 0)
				ARRAY TEXT:C222(<>_Albums; 0)
				ARRAY TEXT:C222(<>_Tracks; 0)
				
				ARRAY LONGINT:C221(<>_StylesIDs; 0)
				ARRAY LONGINT:C221(<>_ArtistsIDs; 0)
				ARRAY LONGINT:C221(<>_AlbumsIDs; 0)
				ARRAY LONGINT:C221(<>_TracksIDs; 0)
				ARRAY LONGINT:C221(<>_TracksCDsNums; 0)
				ARRAY LONGINT:C221(<>_TracksNums; 0)
				ARRAY LONGINT:C221(<>_TracksDurations; 0)
				ARRAY TEXT:C222(<>_TracksPathes; 0)
				
				ALL RECORDS:C47([styles:2])
				ORDER BY:C49([styles:2]; [styles:2]styleName:2; >)
				
				SELECTION TO ARRAY:C260([styles:2]styleName:2; <>_Styles; [styles:2]ID:1; <>_StylesIDs)
				$n:=Size of array:C274(<>_Styles)
				
				ARRAY TEXT:C222(<>_Styles; $n)
				ARRAY TEXT:C222(<>_Artists; $n)
				ARRAY TEXT:C222(<>_Albums; $n)
				ARRAY TEXT:C222(<>_Tracks; $n)
				
				ARRAY LONGINT:C221(<>_StylesIDs; $n)
				ARRAY LONGINT:C221(<>_ArtistsIDs; $n)
				ARRAY LONGINT:C221(<>_AlbumsIDs; $n)
				ARRAY LONGINT:C221(<>_TracksIDs; $n)
				ARRAY LONGINT:C221(<>_TracksCDsNums; $n)
				ARRAY LONGINT:C221(<>_TracksNums; $n)
				ARRAY LONGINT:C221(<>_TracksDurations; $n)
				ARRAY TEXT:C222(<>_TracksPathes; $n)
				
				OBJECT SET RGB COLORS:C628(<>_Styles; 0; Form:C1466.yellow[2]; Form:C1466.yellow[3])
				OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.yellow[2]; Form:C1466.yellow[3])
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				
				OBJECT SET RGB COLORS:C628(<>_TracksCDsNums; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(<>_TracksNums; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				
				OBJECT SET RGB COLORS:C628(<>Dummy; 0; Form:C1466.yellow[4])
				OBJECT SET RGB COLORS:C628(<>TimeFooter; 0; Form:C1466.yellow[0])
				
				LISTBOX COLLAPSE:C1101(*; "EventsListbox"; True:C214; lk all:K53:16)
				
				<>Dummy:=""
				
				ExpandRowCol("EventsListbox"; 4; 1; False:C215)
				ExpandRowCol("EventsListbox"; 6; 2; False:C215)
				ExpandRowCol("EventsListbox"; 7; 3; False:C215)
				
				LISTBOX EXPAND:C1100(*; "EventsListbox"; False:C215; lk break row:K53:18; 4; 1)
				LISTBOX EXPAND:C1100(*; "EventsListbox"; False:C215; lk break row:K53:18; 6; 2)
				LISTBOX EXPAND:C1100(*; "EventsListbox"; False:C215; lk break row:K53:18; 7; 3)
				
				Form:C1466.nbRows1:=Records in table:C83([tracks:5])
				Form:C1466.nbRows2:=Size of array:C274(<>_Tracks)
				
				C_TIME:C306(<>TimeFooter)
				LISTBOX SET FOOTER CALCULATION:C1140(<>TimeFooter; lk footer sum:K70:4)
				
			: (Form:C1466.currentPage=7)  //---------------- heights and alignments ---------------------
				
				RandomFillArrays
				
				
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
				OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[3]; Form:C1466.blue[4])
				
				C_LONGINT:C283(<>RowHeight)
				<>RowHeight:=20
				
				ARRAY TEXT:C222(<>_Unit; 2)
				<>_Unit{1}:=Get localized string:C991("Pixels")
				<>_Unit{2}:=Get localized string:C991("Lines")
				
				<>_Unit:=1
				
				ARRAY TEXT:C222(<>_ApplyTo; 4)
				<>_ApplyTo{1}:=Get localized string:C991("Headers")
				<>_ApplyTo{2}:=Get localized string:C991("Lines")
				<>_ApplyTo{3}:=Get localized string:C991("Footers")
				<>_ApplyTo{4}:=Get localized string:C991("All")
				
				<>_ApplyTo:=2
				
				ARRAY TEXT:C222(<>_Hposition; 3)
				<>_Hposition{1}:=Get localized string:C991("Left")
				<>_Hposition{2}:=Get localized string:C991("Center")
				<>_Hposition{3}:=Get localized string:C991("Right")
				<>_Hposition:=1
				
				ARRAY TEXT:C222(<>_Vposition; 3)
				<>_Vposition{1}:=Get localized string:C991("Top")
				<>_Vposition{2}:=Get localized string:C991("Center")
				<>_Vposition{3}:=Get localized string:C991("Bottom")
				<>_Vposition:=1
				
				Dummy:=""
				<>TimeFooter:=?00:00:00?
				
				OBJECT SET RGB COLORS:C628(<>TimeFooter; 0; Form:C1466.yellow[0])
				
			: (Form:C1466.currentPage=8)  //---------------- locked and static columns ---------------------
				
				
				ARRAY BOOLEAN:C223(HeightDemoLockCols; 100)  // listbox itself
				ARRAY TEXT:C222(<>_Dummy1; 100)
				ARRAY TEXT:C222(<>_Dummy2; 100)
				ARRAY TEXT:C222(<>_Dummy3; 100)
				ARRAY TEXT:C222(<>_Dummy4; 100)
				ARRAY TEXT:C222(<>_Dummy5; 100)
				ARRAY TEXT:C222(<>_Dummy6; 100)
				ARRAY TEXT:C222(<>_Dummy7; 100)
				ARRAY TEXT:C222(<>_Dummy8; 100)
				ARRAY TEXT:C222(<>_Dummy9; 100)
				ARRAY TEXT:C222(<>_Dummy10; 100)
				For ($i; 1; 100)
					<>_Dummy1{$i}:=String:C10(Add to date:C393(Current date:C33; 0; 0; Random:C100%50))
					<>_Dummy2{$i}:=String:C10(1000+(Random:C100%1000))
					<>_Dummy3{$i}:=String:C10(1000+(Random:C100%1000))
					<>_Dummy4{$i}:=String:C10(10+(Random:C100%10))
					<>_Dummy5{$i}:=String:C10(20+(Random:C100%20))
					<>_Dummy6{$i}:=String:C10(100/(1+Random:C100); "###,##0.00")
					<>_Dummy7{$i}:=String:C10(1000+(Random:C100%1000))
					<>_Dummy8{$i}:=String:C10(1000+(Random:C100%1000))
					<>_Dummy9{$i}:=String:C10(100/(1+Random:C100); "###,##0.00")
					<>_Dummy10{$i}:=String:C10(10+(Random:C100%10))
				End for 
				
				Form:C1466.staticColumns:=0
				Form:C1466.lockedColumns:=0
				
				Form:C1466.infoStatic:=Get localized string:C991("StaticInfos0")
				Form:C1466.infoLocked:=Get localized string:C991("LockInfos0")
				
				
				OBJECT SET RGB COLORS:C628(*; "HeightDemoLockCols"; 0; Form:C1466.yellow[3]; Form:C1466.yellow[3])
				
			: (Form:C1466.currentPage=9)  //locked rows and cells
				
				RandomFillArrays
				
				OBJECT SET RGB COLORS:C628(<>_Tracks; 0x0000; 0x00FFFFFF; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(<>_Artists; 0x0000; 0x00FFFFFF; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0x0000; 0x00FFFFFF; 0x00FFFFFF)
				
				$n:=Size of array:C274(<>_Tracks)
				
				ARRAY BOOLEAN:C223(<>RawLock; $n)
				ARRAY LONGINT:C221(<>RawLockColor; $n)
				ARRAY LONGINT:C221(<>RawLockStyle; $n)
				
				For ($i; 1; $n)
					If (Random:C100>(2*Random:C100))
						<>_Tracks{$i}:=""
					End if 
					If (Random:C100>(2*Random:C100))
						<>_Artists{$i}:=""
					End if 
					If (Random:C100>(2*Random:C100))
						<>_TracksDurations{$i}:=0
					End if 
					
					<>RawLock{$i}:=(Random:C100>(Random:C100+Random:C100))
					If (<>RawLock{$i})
						<>RawLockColor{$i}:=Form:C1466.yellow[0]
						<>RawLockStyle{$i}:=1
					Else 
						<>RawLockColor{$i}:=Form:C1466.yellow[3]
						<>RawLockStyle{$i}:=0
					End if 
				End for 
				
				Form:C1466.infoSuite:=Get localized string:C991("TextInfos_9a")
				
			: (Form:C1466.currentPage=10)  //Stlyed text in rows
				
				QUERY:C277([tracks:5]; [tracks:5]name:1="A@")
				ORDER BY:C49([tracks:5]; [tracks:5]name:1; >)
				REDUCE SELECTION:C351([tracks:5]; 20)
				
				SELECTION TO ARRAY:C260([tracks:5]nameStyled:2; <>_Tracks_S; *)
				SELECTION TO ARRAY:C260([albums:4]nameStyled:5; <>_Albums_S; *)
				SELECTION TO ARRAY:C260([artists:3]nameStyled:4; <>_Artists_S)
				
			: (Form:C1466.currentPage=11)  //collections
				$get:=New collection:C1472("album.artist.name"; "album.name"; "name"; "duration")
				$formula:=Formula:C1597(Random:C100)
				
				Form:C1466.trackCollection:=ds:C1482.tracks.all().orderByFormula($formula).toCollection($get; 0; 0; 99).orderBy("album.artist.name asc")
				OBJECT SET VALUE:C1742("LB_Collection_Footer1"; "Count:")
				OBJECT SET VALUE:C1742("LB_Collection_Footer3"; "Average:")
				
			: (Form:C1466.currentPage=12)  //E.S.
				Form:C1466.tracks:=ds:C1482.tracks.all().orderBy("name asc")
				
				OBJECT SET VALUE:C1742("LB_EntSelection_Footer1"; "Count:")
				OBJECT SET VALUE:C1742("LB_EntSelection_Footer3"; "Average:")
				
		End case 
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		If (Form:C1466.init=True:C214)
			Form:C1466.init:=False:C215
			Form:C1466.currentPage:=1
			FORM GOTO PAGE:C247(Form:C1466.currentPage)
			GOTO OBJECT:C206(*; "LB_Functions")
		End if 
		
		LISTBOX SELECT ROW:C912(*; "LB_Functions"; Form:C1466.currentPage; lk replace selection:K53:1)
		
	: (Form event code:C388=On Unload:K2:2)
		
		//ACTIVER LIGNE MENU(2;0)  `edit
		//ACTIVER LIGNE MENU(3;0)  `mode
		
		RELEASE MENU:C978(Form:C1466.calculationMenu)
		RELEASE MENU:C978(Form:C1466.contentMenu)
		
End case 
