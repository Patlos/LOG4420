module Handler.Accueil where

import Import

getAccueilR :: Handler Html
getAccueilR = defaultLayout $ do
        setTitle "Castle Death"
        addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
        $(widgetFile "navigation")
        toWidget [julius|
          	$("#accueil").addClass("current");
        |]
        $(widgetFile "accueil")
        $(widgetFile "footer")
        $(widgetFile "main")
        
