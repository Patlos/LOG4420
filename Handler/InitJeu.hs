module Handler.InitJeu where

import 		Import

data Person = Person
	{
		habilete	:: Integer,
		endurance	:: Integer,
		nbOr		:: Integer,
		disciplines	:: [Text],
		objets		:: [Text]
	}deriving Show
	
--personForm :: Html -> MForm Handler (FormResult Person, Widget)
	              -- <a href=@{PageR}/#{pageCourante} class="button">Retourner à la page : #{pageCourante}
	              -- <a href=@{InitJeuR} class="button">Recommencer la partie!
	              -- partieCourante <- lookupSession "partieCourante"
	   			-- pageCourante <- lookupSession "pageCourante"

getInitJeuR :: Handler Html
getInitJeuR = defaultLayout  $ do
			setTitle "Castle Death"
			addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
			toWidget [julius|
          		$("#jeu").addClass("current");
        	|]
			$(widgetFile "navigation")
			$(widgetFile "person_creation")
			$(widgetFile "footer")
			$(widgetFile "main")


			

postInitJeuR :: Handler Html
postInitJeuR = error "Not yet implemented: postInitJeuR"
