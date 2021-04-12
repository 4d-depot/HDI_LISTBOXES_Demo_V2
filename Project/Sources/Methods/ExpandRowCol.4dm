//%attributes = {}
C_TEXT:C284($1)  //listbox object name
C_LONGINT:C283($2; $3)
C_BOOLEAN:C305($4)
C_LONGINT:C283($5)  //current level (optionnel)

C_TEXT:C284($ListboxName)
C_LONGINT:C283($Column; $Row)
C_BOOLEAN:C305($Option; $Ignore)
C_LONGINT:C283($Level)  //current level (optionnel)

C_LONGINT:C283($i; $ID; $n)


$ListboxName:=$1
$Row:=$2
$Column:=$3
$Option:=$4
If (Count parameters:C259>=5)
	$Level:=$5
Else 
	$Level:=1
End if 


//Lets declare 3 arrays with $n lines (for each value found))
ARRAY TEXT:C222($t2; 0)
ARRAY TEXT:C222($t3; 0)
ARRAY TEXT:C222($t4; 0)
ARRAY LONGINT:C221($t4b; 0)
ARRAY LONGINT:C221($t4c; 0)
ARRAY LONGINT:C221($t4d; 0)
ARRAY TEXT:C222($t4e; 0)

ARRAY LONGINT:C221($t12; 0)
ARRAY LONGINT:C221($t13; 0)
ARRAY LONGINT:C221($t14; 0)

$Ignore:=False:C215
Case of 
	: ($Column=1)
		$ID:=<>_StylesIDs{$Row}
		QUERY:C277([ARTISTS:3]; [ARTISTS:3]StyleID:3=$ID)
		ORDER BY:C49([ARTISTS:3]; [ARTISTS:3]ArtistName:2; >)
		SELECTION TO ARRAY:C260([ARTISTS:3]ArtistName:2; $t2; [ARTISTS:3]ID:1; $t12)
		$n:=Size of array:C274($t2)
		
	: ($Column=2)
		$ID:=<>_ArtistsIDs{$Row}
		QUERY:C277([ALBUMS:4]; [ALBUMS:4]ArtistID:3=$ID)
		ORDER BY:C49([ALBUMS:4]; [ALBUMS:4]AlbumName:2; >)
		SELECTION TO ARRAY:C260([ALBUMS:4]AlbumName:2; $t3; [ALBUMS:4]ID:1; $t13)
		$n:=Size of array:C274($t3)
		
	: ($Column=3)
		$ID:=<>_AlbumsIDs{$Row}
		QUERY:C277([TRACKS:5]; [TRACKS:5]AlbumID:19=$ID)
		ORDER BY:C49([TRACKS:5]; [TRACKS:5]TrackNo:5; >)
		
		SELECTION TO ARRAY:C260([TRACKS:5]TrackName:1; $t4; *)
		SELECTION TO ARRAY:C260([TRACKS:5]ID:18; $t14; *)
		
		SELECTION TO ARRAY:C260([TRACKS:5]CdNo:15; $t4b; *)
		SELECTION TO ARRAY:C260([TRACKS:5]TrackNo:5; $t4c; *)
		SELECTION TO ARRAY:C260([TRACKS:5]Duration:10; $t4d; *)
		SELECTION TO ARRAY:C260([TRACKS:5]FilePath:6; $t4e)
		
		$n:=Size of array:C274($t4)
		
	Else 
		$Ignore:=True:C214
End case 

If ($Ignore=False:C215)
	
	//Lets declare 3 arrays witn the same number of  lines ($n) even if one is already filled
	ARRAY TEXT:C222($t2; $n)
	ARRAY TEXT:C222($t3; $n)
	ARRAY TEXT:C222($t4; $n)
	ARRAY LONGINT:C221($t12; $n)
	ARRAY LONGINT:C221($t13; $n)
	ARRAY LONGINT:C221($t14; $n)
	
	LISTBOX INSERT ROWS:C913(*; $ListboxName; $Row+1; $n-1)
	
	For ($i; 1; $n)
		
		Case of 
				
			: ($Column=1)
				
				If ($i>1)  //if i = 1 do nothing, the cell is already filled
					<>_Styles{$Row}:=<>_Styles{$Row-1}  //for cells below , just copy the content of the previous one
					<>_StylesIDs{$Row}:=<>_StylesIDs{$Row-1}  //for cells below , just copy the content of the previous one
				End if 
				
				<>_Artists{$Row}:=$t2{$i}  //the next column has to be filled by the found values
				<>_ArtistsIDs{$Row}:=$t12{$i}  //the next column has to be filled by the found values
				
				<>_Albums{$Row}:=""  // keep others empty
				<>_AlbumsIDs{$Row}:=0  // keep others empty
				
				<>_Tracks{$Row}:=""  // keep others empty
				<>_TracksIDs{$Row}:=0  // keep others empty
				<>_TracksCDsNums{$Row}:=0
				<>_TracksNums{$Row}:=0  // keep others empty
				<>_TracksDurations{$Row}:=0  // keep others empty
				<>_TracksPathes{$Row}:=""  // keep others empty
				
			: ($Column=2)
				
				If ($i>1)  //if i = 1 do nothing, the cell is already filled
					<>_Styles{$Row}:=<>_Styles{$Row-1}  //for cells below , just copy the content of the previous one
					<>_StylesIDs{$Row}:=<>_StylesIDs{$Row-1}  //for cells below , just copy the content of the previous one
					
					<>_Artists{$Row}:=<>_Artists{$Row-1}  //for cells below , just copy the content of the previous one
					<>_ArtistsIDs{$Row}:=<>_ArtistsIDs{$Row-1}  //for cells below , just copy the content of the previous one
				End if 
				
				<>_Albums{$Row}:=$t3{$i}  //the next column has to be filled by the  found values
				<>_AlbumsIDs{$Row}:=$t13{$i}  //the next column has to be filled by the  found values
				
				<>_Tracks{$Row}:=""  // keep others empty
				<>_TracksIDs{$Row}:=0  // keep others empty
				<>_TracksCDsNums{$Row}:=0
				<>_TracksNums{$Row}:=0  // keep others empty
				<>_TracksDurations{$Row}:=0  // keep others empty
				<>_TracksPathes{$Row}:=""  // keep others empty
				
			: ($Column=3)
				
				If ($i>1)  //if i = 1 do nothing, the cell is already filled
					<>_Styles{$Row}:=<>_Styles{$Row-1}  //for cells below , just copy the content of the previous one
					<>_StylesIDs{$Row}:=<>_StylesIDs{$Row-1}  //for cells below , just copy the content of the previous one
					
					<>_Artists{$Row}:=<>_Artists{$Row-1}  //for cells below , just copy the content of the previous one
					<>_ArtistsIDs{$Row}:=<>_ArtistsIDs{$Row-1}  //for cells below , just copy the content of the previous one
					
					<>_Albums{$Row}:=<>_Albums{$Row-1}  //for cells below , just copy the content of the previous one
					<>_AlbumsIDs{$Row}:=<>_AlbumsIDs{$Row-1}  //for cells below , just copy the content of the previous one
				End if 
				
				<>_Tracks{$Row}:=$t4{$i}  //the next column has to be filled by the distinct found values
				<>_TracksIDs{$Row}:=$t14{$i}  //the next column has to be filled by the distinct found values
				<>_TracksCDsNums{$Row}:=$t4b{$i}
				<>_TracksNums{$Row}:=$t4c{$i}
				<>_TracksDurations{$Row}:=$t4d{$i}
				<>_TracksPathes{$Row}:=$t4e{$i}
				
		End case 
		
		$Row:=$Row+1
	End for 
	
	$Row:=$Row-$n  //back to original clicked line
	
	// When done you have to be sure the inserted lines are collapsed (as long as cells below (actually on the "right") are empty
	// There are $n values found, so they all should be collapsed
	// TWO EXCEPTIONS : 
	// - recursive expand has been requested (using Option Key
	// - The inserted raw was previously expanded;so it must be expanded again
	
	
	Case of 
		: ($Column=1)  // style -> may expand artists
			
			For ($i; $n; 1; -1)  //must go BACKWARDS because lines are INSERTED BELOW so backwards works… 
				If ($Option)
					ExpandRowCol($ListboxName; $Row+$i-1; 2; $Option; $Level+1)  //RECURSIVE CALL
				Else 
					LISTBOX COLLAPSE:C1101(*; $ListboxName; True:C214; lk break row:K53:18; $Row+$i-1; 2)
				End if 
			End for 
			
		: ($Column=2)  // artist -> may expand albums
			
			For ($i; $n; 1; -1)  //must go BACKWARDS because lines are INSERTED BELOW so backwards works… 
				If ($Option)
					ExpandRowCol($ListboxName; $Row+$i-1; 3; $Option; $Level+1)  //RECURSIVE CALL
				Else 
					LISTBOX COLLAPSE:C1101(*; $ListboxName; True:C214; lk break row:K53:18; $Row+$i-1; 3)
				End if 
			End for 
			
		: ($Column=3)
			
	End case 
	
	//at least, the listbox must be expanded at XY
	// this is not mandatory in case of NON recusrsive call (the cell has already been clicked
	//and the event "on expand" has already been generated
	
	If ($Level>1)
		LISTBOX EXPAND:C1100(*; "ListBox"; False:C215; lk break row:K53:18; $Row; $Column)
	Else 
		// useless, 4d will do it itself ! (already done)
	End if 
	
End if 