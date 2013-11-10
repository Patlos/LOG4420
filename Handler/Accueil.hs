module Handler.Accueil where

import Import

getAccueilR :: Handler Html
getAccueilR = defaultLayout $ do
        setTitle "Castle Death"
        $(widgetFile "navigation")
        $(widgetFile "accueil")
        $(widgetFile "footer")
        $(widgetFile "main")
