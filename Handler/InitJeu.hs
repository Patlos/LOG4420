module Handler.InitJeu where

import Import

getInitJeuR :: Handler Html
getInitJeuR = defaultLayout  $ do
			setTitle "Castle Death"
			$(widgetFile "person_creation")

postInitJeuR :: Handler Html
postInitJeuR = error "Not yet implemented: postInitJeuR"
