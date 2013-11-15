module Handler.Page where

import Import

-- data Page = Page Text Text deriving (Show)
 -- type Pages = [Page]

getPageR :: Text -> Handler Html
getPageR pagedId = defaultLayout  $ do
	[whamlet|<h1>Le numero de ma page #{pagedId}!|]
    -- $(widgetFile "navigation")
    -- $(widgetFile "footer")
    -- $(widgetFile "main")

postPageR :: Text -> Handler Html
postPageR  = error "Not yet implemented: postPageR"
