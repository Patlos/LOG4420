module Handler.JeterObjets where

import Import
import Data.Text

data Objects = Objects
    { keys :: Text
    }
    deriving Show

postJeterObjetsR :: Handler Html
postJeterObjetsR = do
    objects <- runInputPost $ Objects
                <$> ireq hiddenField "keys"
    let [obj1,obj2,videObj] = splitOn (pack "|") $ keys objects
    case obj1 of
        "Épée" -> deleteSession "epee"
        "Arc" -> deleteSession "arc"
        "Carquois" -> deleteSession "carquois"
        "Corde" -> deleteSession "corde"
        "Potion de Laumspur" -> deleteSession "potionLaumspur"
        "Poignard" -> deleteSession "poignard"
        "Lanterne" -> deleteSession "lanterne"
        "Masse d'armes" -> deleteSession "masseArmes"
        "Trois rations spéciales" -> deleteSession "rationsSpeciales"
        "Trois graines de feu" -> deleteSession "grainesFeu"
    case obj2 of
        "Épée" -> deleteSession "epee"
        "Arc" -> deleteSession "arc"
        "Carquois" -> deleteSession "carquois"
        "Corde" -> deleteSession "corde"
        "Potion de Laumspur" -> deleteSession "potionLaumspur"
        "Poignard" -> deleteSession "poignard"
        "Lanterne" -> deleteSession "lanterne"
        "Masse d'armes" -> deleteSession "masseArmes"
        "Trois rations spéciales" -> deleteSession "rationsSpeciales"
        "Trois graines de feu" -> deleteSession "grainesFeu"
    redirect $ PageR 158