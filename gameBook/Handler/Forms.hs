module Handler.Forms 
( Character(..)
, characterForm) where

import Import

data Character = Character
	{ pntHabilete :: Int
	, pntEndurance :: Int
	, piecesOr :: Int
	, disciplines :: [Text]
	, items :: [Text]
	}
	deriving (Show, Read)
	
characterForm :: Form Character
characterForm = renderDivs $ Character
    <$> areq intField (FieldSettings {fsLabel = "Points d'habilete: ", fsTooltip = Nothing, fsId = Just "pnt_habilete", fsName = Nothing, fsAttrs = []}) Nothing
    <*> areq intField (FieldSettings {fsLabel = "Points d'endurance: ", fsTooltip = Nothing, fsId = Just "pnt_endurance", fsName = Nothing, fsAttrs = []}) Nothing
    <*> areq intField (FieldSettings {fsLabel = "Pieces d'or: ", fsTooltip = Nothing, fsId = Just "pieces_or", fsName = Nothing, fsAttrs = []}) Nothing
    <*> areq disciplinesField "" Nothing
    <*> areq itemsField "" Nothing

disciplinesField :: Field Handler [Text]
disciplinesField = Field
    { fieldParse = \rawVals _fileVals ->
        case rawVals of
            a -> case length a of
                    3 -> return $ Right $ Just a
                    _ -> return $ Left "Vous devez choisir exactement trois disciplines."

    , fieldView = \_ nameAttr _ _ _ ->
        [whamlet|
            <fieldset id="disciplines">
                <legend>Disciplines</legend>
                <p>Choisir 3 disciplines:

                <section class="left">
                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Science des armes" />
                        <label for="weaponMastery">La science des armes

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Controle Animal" />
                        <label for="animalControl">Contrôle animal</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Science Medicale" />
                        <label for="curing">Science médical</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Invisibilite" />
                        <label for="invisibility">Invisibilité

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Art de la chasse" />
                        <label for="huntMastery">Art de la chasse</label>

                <section class="right">
                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Exploration" />
                        <label for="pathsmanship">Exploration</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Foudroiement psychique" />
                        <label for="psiSurge">Foudroiement psychique</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Ecran psychique" />
                        <label for="psiScreen">Écran psychique</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Nexus" />
                        <label for="nexus">Nexus</label>

                    <section>
                        <input type="checkbox" name=#{nameAttr} value="Intuition" />
                        <label for="divination">Intuition</label>
        |]

    , fieldEnctype = UrlEncoded
    }


itemsField :: Field Handler [Text]
itemsField = Field
    { fieldParse = \rawVals _fileVals ->
        case rawVals of
            a -> case length a of
                    5 -> return $ Right $ Just a
                    _ -> return $ Left "Vous devez choisir exactement 5 objets."

    , fieldView = \_ nameAttr _ _ _ ->
        [whamlet|
            <fieldset id="objets">
                <legend>Objets initiaux	
                <p>Choisir 5 objets:

                <section>
                    <input type="checkbox" class="weapon" name=#{nameAttr} value="Épée" />
                    <label for="epee">Épée</label> (Arme)

                <section>
                    <input type="checkbox" class="weapon" name=#{nameAttr} value="Arc" />
                    <label for="arc">Arc</label> (Arme)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Carquois" />
                    <label for="carquois">Carquois</label> (Object spécial)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Corde" />
                    <label for="corde">Corde</label> (Object contenu dans le sac à dos)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Potion de Laumspur" />
                    <label for="potionLaumspur">Potion de Laumspur</label> (Objet contenu dans le sac à dos)

                <section>
                    <input type="checkbox" class="weapon" name=#{nameAttr} value="Poignard" />
                    <label for="poignard">Poignard</label> (Arme)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Lanterne" />
                    <label for="lanterne">Lanterne</label> (Object contenu dans le sac à dos)

                <section>
                    <input type="checkbox" class="weapon" name=#{nameAttr} value="Masse d'armes" />
                    <label for="masseArmes">Masse d'armes</label> (Arme)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Trois rations spéciales" />
                    <label for="rationsSpeciales">Trois rations spéciales</label> (Repas)

                <section>
                    <input type="checkbox" name=#{nameAttr} value="Trois graines de feu" />
                    <label for="grainesFeu">Trois graines de feu</label> (Object spécial)
        |]

    , fieldEnctype = UrlEncoded
    }