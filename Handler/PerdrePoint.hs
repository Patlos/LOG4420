module Handler.PerdrePoint where

import Import
import Data.Text

data PntPerdre = PntPerdre
    { valeur :: Text
    , pageToGo :: Text
    }
    deriving Show

class Nothingish a where
    value :: a
instance Nothingish (Maybe a) where
    value = Nothing
instance Nothingish Text where
    value = ""

eliminate :: (Nothingish a) => Maybe a -> a
eliminate (Just a) = a
eliminate Nothing  = value

postPerdrePointR :: Handler Html
postPerdrePointR = do
    pntPerdre <- runInputPost $ PntPerdre
                <$> ireq hiddenField "pntToLose"
                <*> ireq hiddenField "pageToGo"
    pointEndurance <- lookupSession "pointEndurance"
    let pntEndurance = read $ unpack $ eliminate pointEndurance
    let pnt = read $ unpack $ valeur pntPerdre
    let newPntEndurance = pack $ show (pntEndurance - pnt)
    setSession "pointEndurance" newPntEndurance
    let page = read $ unpack $ pageToGo pntPerdre
    redirect $ PageR page