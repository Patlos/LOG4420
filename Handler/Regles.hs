module Handler.Regles where

import Import

getReglesR :: Handler Html
getReglesR = defaultLayout $ do
        setTitle "Castle Death"
        addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
        toWidget [julius|
          	$("#regleJeu").addClass("current");
        |]
        $(widgetFile "navigation")
        $(widgetFile "regles")
        $(widgetFile "footer")
        $(widgetFile "main")

