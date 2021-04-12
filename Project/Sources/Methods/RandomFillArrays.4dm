//%attributes = {}
C_LONGINT:C283($1)

C_LONGINT:C283($i; $n; $m)

Case of 
	: (Count parameters:C259=0)
		
		ARRAY TEXT:C222(<>_Tracks; 0)
		ARRAY TEXT:C222(<>_Artists; 0)
		ARRAY TEXT:C222(<>_Albums; 0)
		ARRAY LONGINT:C221(<>_TracksDurations; 0)
		
		ALL RECORDS:C47([TRACKS:5])
		$n:=Records in selection:C76([TRACKS:5])
		$m:=100
		
		CREATE EMPTY SET:C140([TRACKS:5]; "$SelTraks")
		For ($i; 1; $m)
			GOTO SELECTED RECORD:C245([TRACKS:5]; (Random:C100%$n)+1)
			ADD TO SET:C119([TRACKS:5]; "$SelTraks")
		End for 
		USE SET:C118("$SelTraks")
		CLEAR SET:C117("$SelTraks")
		SELECTION TO ARRAY:C260([TRACKS:5]TrackName:1; <>_Tracks; *)
		SELECTION TO ARRAY:C260([ARTISTS:3]ArtistName:2; <>_Artists; *)
		SELECTION TO ARRAY:C260([ALBUMS:4]AlbumName:2; <>_Albums; *)
		SELECTION TO ARRAY:C260([TRACKS:5]Duration:10; <>_TracksDurations)
		
	: ($1=2)
		
		ARRAY TEXT:C222(<>_Tracks; 0)
		ARRAY TEXT:C222(<>_Artists; 0)
		ARRAY TEXT:C222(<>_Albums; 0)
		ARRAY LONGINT:C221(<>_TracksDurations; 0)
		
		ALL RECORDS:C47([ARTISTS:3])
		$n:=Records in selection:C76([ARTISTS:3])
		$m:=10
		
		CREATE EMPTY SET:C140([ARTISTS:3]; "$SelArtists")
		For ($i; 1; $m)
			GOTO SELECTED RECORD:C245([ARTISTS:3]; (Random:C100%$n)+1)
			ADD TO SET:C119([ARTISTS:3]; "$SelArtists")
		End for 
		
		USE SET:C118("$SelArtists")
		
		RELATE MANY SELECTION:C340([ALBUMS:4]ArtistID:3)
		RELATE MANY SELECTION:C340([TRACKS:5]AlbumID:19)
		
		SELECTION TO ARRAY:C260([TRACKS:5]TrackName:1; <>_Tracks; *)
		SELECTION TO ARRAY:C260([ARTISTS:3]ArtistName:2; <>_Artists; *)
		SELECTION TO ARRAY:C260([ALBUMS:4]AlbumName:2; <>_Albums; *)
		SELECTION TO ARRAY:C260([TRACKS:5]Duration:10; <>_TracksDurations)
		
End case 

