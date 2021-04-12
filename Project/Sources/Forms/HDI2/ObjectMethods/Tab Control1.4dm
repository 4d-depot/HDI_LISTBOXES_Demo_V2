
C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($Width)

OBJECT GET COORDINATES:C663(*; "LB_Hierachical"; $x1; $y1; $x2; $y2)
$Width:=$x2-$x1-110-20  // 110 = last column width, 20 = Scrollbar

Case of 
	: (TC3=1)
		LISTBOX SET HIERARCHY:C1098(*; "LB_Hierachical"; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "HCOL2"; True:C214)
		OBJECT SET VISIBLE:C603(*; "HCOL3"; True:C214)
		
		OBJECT SET TITLE:C194(*; "HierarchicalHeader"; Get localized string:C991("Artists"))
		
		LISTBOX SET COLUMN WIDTH:C833(*; "HCOL1"; $Width/3)
		LISTBOX SET COLUMN WIDTH:C833(*; "HCOL2"; $Width/3)
		LISTBOX SET COLUMN WIDTH:C833(*; "HCOL3"; $Width/3)
		
		OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
		OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.yellow[1]; Form:C1466.yellow[2])
		OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
		OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.yellow[2]; Form:C1466.yellow[3])
		
	: (TC3=2)
		
		ARRAY POINTER:C280($Array; 3)
		$Array{1}:=-><>_Artists
		$Array{2}:=-><>_Albums
		$Array{3}:=-><>_Tracks
		
		LISTBOX SET HIERARCHY:C1098(*; "LB_Hierachical"; True:C214; $Array)
		LISTBOX COLLAPSE:C1101(*; "LB_Hierachical"; True:C214)
		LISTBOX EXPAND:C1100(*; "LB_Hierachical"; True:C214; lk break row:K53:18; 1; 2)
		
		OBJECT SET VISIBLE:C603(*; "HCOL2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "HCOL3"; False:C215)
		
		OBJECT SET TITLE:C194(*; "HierarchicalHeader"; Get localized string:C991("ArtistsAlbumsTracks"))
		
		LISTBOX SET COLUMN WIDTH:C833(*; "HCOL1"; $Width)
		
		OBJECT SET RGB COLORS:C628(<>_Artists; 0; Form:C1466.blue[1]; Form:C1466.blue[2])
		OBJECT SET RGB COLORS:C628(<>_Albums; 0; Form:C1466.yellow[1]; Form:C1466.yellow[2])
		OBJECT SET RGB COLORS:C628(<>_Tracks; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
		OBJECT SET RGB COLORS:C628(<>_TracksDurations; 0; Form:C1466.blue[2]; Form:C1466.blue[3])
		
End case 
