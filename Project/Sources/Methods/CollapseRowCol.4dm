//%attributes = {}

C_TEXT:C284($1)
C_LONGINT:C283($2; $3)
C_BOOLEAN:C305($4)

C_LONGINT:C283($Column; $Row; $p; $ID)
C_TEXT:C284($ListboxName)
C_TEXT:C284($Value)
C_BOOLEAN:C305($Option)
C_BOOLEAN:C305($Ignore)
C_POINTER:C301($Ptr)

$ListboxName:=$1
$Row:=$2
$Column:=$3

$Option:=$4


$Ignore:=False:C215
Case of 
	: ($Column=1)
		$Ptr:=-><>_Styles
		
		$Value:=<>_Styles{$Row}
		$ID:=<>_StylesIDs{$Row}
		
		<>_Artists{$Row}:=""
		<>_ArtistsIDs{$Row}:=0
		
		<>_Albums{$Row}:=""
		<>_AlbumsIDs{$Row}:=0
		
		<>_Tracks{$Row}:=""
		<>_TracksIDs{$Row}:=0
		<>_TracksNums{$Row}:=0
		<>_TracksDurations{$Row}:=0
		
	: ($Column=2)
		$Ptr:=-><>_Artists
		
		$Value:=<>_Artists{$Row}
		$ID:=<>_ArtistsIDs{$Row}
		
		<>_Albums{$Row}:=""
		<>_AlbumsIDs{$Row}:=0
		
		<>_Tracks{$Row}:=""
		<>_TracksIDs{$Row}:=0
		<>_TracksNums{$Row}:=0
		<>_TracksDurations{$Row}:=0
		
	: ($Column=3)
		$Ptr:=-><>_Albums
		
		$Value:=<>_Albums{$Row}
		$ID:=<>_AlbumsIDs{$Row}
		
		<>_Tracks{$Row}:=""
		<>_TracksIDs{$Row}:=0
		<>_TracksNums{$Row}:=0
		<>_TracksDurations{$Row}:=0
		
	Else 
		$Ignore:=True:C214
End case 

If ($Ignore=False:C215)
	
	$p:=$Row
	
	Repeat 
		$p:=Find in array:C230($Ptr->; $Value; $Row+1)
		If ($p>0)
			LISTBOX DELETE ROWS:C914(*; $ListboxName; $p)
		End if 
	Until ($p<0)
	
	
End if 

//LISTBOX COLLAPSE(*;"ListBox";False;Listbox Break row;$Row;$Column)

