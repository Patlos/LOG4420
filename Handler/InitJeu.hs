module Handler.InitJeu where

import Import

data Person = Person
	{
		habilete	:: Integer,
		endurance	:: Integer,
		nbOr		:: Integer,
		disciplines	:: [Text],
		objets		:: [Text]
	}deriving Show
	
--personForm :: Html -> MForm Handler (FormResult Person, Widget)


getInitJeuR :: Handler Html
getInitJeuR = defaultLayout  $ do
			setTitle "Castle Death"
			addScriptRemote "http://code.jquery.com/jquery-1.10.1.js"
			$(widgetFile "navigation")
			$(widgetFile "person_creation")
			$(widgetFile "footer")
			$(widgetFile "main")
			

postInitJeuR :: Handler Html
postInitJeuR = error "Not yet implemented: postInitJeuR"
