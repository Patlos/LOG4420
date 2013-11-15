module Handler.InitJeu where

import 		Import

data Person = Person
	{	weaponMastery	:: Maybe Bool
	,	animalControl	:: Maybe Bool
	,	curing			:: Maybe Bool
	,	invisibility	:: Maybe Bool
	,	huntMastery		:: Maybe Bool
	,	pathsmanship	:: Maybe Bool
	,	psiSurge		:: Maybe Bool
	,	psiScreen		:: Maybe Bool
	,	nexus			:: Maybe Bool
	,	divination		:: Maybe Bool
	}deriving Show
	
personForm :: Html -> MForm Handler (FormResult Person, Widget)
personForm = renderDivs $ Person
    <$> aopt checkBoxField "La science des armes" Nothing
	<*> aopt checkBoxField "Contrôle animal" Nothing
	<*> aopt checkBoxField "Science médical" Nothing
	<*> aopt checkBoxField "Invisibilité" Nothing
	<*> aopt checkBoxField "Art de la chasse" Nothing
	<*> aopt checkBoxField "Exploration" Nothing
	<*> aopt checkBoxField "Foudroiement psychique" Nothing
	<*> aopt checkBoxField "Écran psychique" Nothing
	<*> aopt checkBoxField "Nexus" Nothing
	<*> aopt checkBoxField "Intuition" Nothing

getInitJeuR :: Handler Html
getInitJeuR = do
(widget, enctype) <- generateFormPost personForm
defaultLayout $ do
setTitle "Castle Death"
addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
toWidget [julius|
	$("#jeu").addClass("current");
|]
$(widgetFile "navigation")
$(widgetFile "personCreation")
$(widgetFile "footer")
$(widgetFile "main")


