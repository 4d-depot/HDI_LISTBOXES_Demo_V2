//%attributes = {}

////this method has to be copied and executed from the host database

//C_LONGINT($i; $n)
//C_TEXT($Text)

//$n:=8  //nb of strings to sned to the About Component

//ARRAY TEXT($_xlifNames; $n)

//$_xlifNames{1}:="demo_name"
//$_xlifNames{2}:="demo_version"
//$_xlifNames{3}:="demo_author"
//$_xlifNames{4}:="demo_website"
//$_xlifNames{5}:="demo_copyright"
//$_xlifNames{6}:="demo_tutorialText"
//$_xlifNames{7}:="demo_legalText"
//$_xlifNames{8}:="demo_copyright"

//For ($i; 1; $n)
//$Text:=Get localized string($_xlifNames{$i})
//Demo_SetVariable($_xlifNames{$i}; $Text)
//End for 


//$Text:=Get localized string("demo_aboutMenuLib")
//SET ABOUT($Text; "Demo_About")
