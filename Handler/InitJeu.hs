module Handler.InitJeu where

import 		Import

data Person = Person
    { 	weaponMastery	:: Maybe Bool
	,	animalControl	:: Maybe Bool
	,	curing			:: Maybe Bool
	,	invisibility	:: Maybe Bool
	,	huntMastery		:: Maybe Bool
	,	pathsmanship	:: Maybe Bool
	,	psiSurge		:: Maybe Bool
	,	psiScreen		:: Maybe Bool
	,	nexus			:: Maybe Bool
	,	divination		:: Maybe Bool
	,	epee			:: Maybe Bool
	,	arc				:: Maybe Bool
	,	carquois		:: Maybe Bool
	,	corde			:: Maybe Bool
	,	potionLaumspur	:: Maybe Bool
	,	poignard		:: Maybe Bool
	,	lanterne		:: Maybe Bool
	,	masseArmes		:: Maybe Bool
	,	rationsSpeciales:: Maybe Bool
	,	grainesFeu		:: Maybe Bool
    }
    deriving Show

personForm :: Html -> MForm Handler (FormResult Person, Widget)
personForm extra = do
    (weaponMasteryRes, weaponMasteryView) <- mopt checkBoxField "weaponMastery" Nothing
    (animalControlRes, animalControlView) <- mopt checkBoxField "animalControl" Nothing
    (curingRes, curingView) <- mopt checkBoxField "curing" Nothing
    (invisibilityRes, invisibilityView) <- mopt checkBoxField "invisibility" Nothing
    (huntMasteryRes, huntMasteryView) <- mopt checkBoxField "huntMastery" Nothing
    (pathsmanshipRes, pathsmanshipView) <- mopt checkBoxField "pathsmanship" Nothing
    (psiSurgeRes, psiSurgeView) <- mopt checkBoxField "psiSurge" Nothing
    (psiScreenRes, psiScreenView) <- mopt checkBoxField "psiScreen" Nothing
    (nexusRes, nexusView) <- mopt checkBoxField "nexus" Nothing
    (divinationRes, divinationView) <- mopt checkBoxField "divination" Nothing
    (epeeRes, epeeView) <- mopt checkBoxField "epee" Nothing
    (arcRes, arcView) <- mopt checkBoxField "arc" Nothing
    (carquoisRes, carquoisView) <- mopt checkBoxField "carquois" Nothing
    (cordeRes, cordeView) <- mopt checkBoxField "corde" Nothing
    (potionLaumspurRes, potionLaumspurView) <- mopt checkBoxField "potionLaumspur" Nothing
    (poignardRes, poignardView) <- mopt checkBoxField "poignard" Nothing
    (lanterneRes, lanterneView) <- mopt checkBoxField "lanterne" Nothing
    (masseArmesRes, masseArmesView) <- mopt checkBoxField "masseArmes" Nothing
    (rationsSpecialesRes, rationsSpecialesView) <- mopt checkBoxField "rationsSpeciales" Nothing
    (grainesFeuRes, grainesFeuView) <- mopt checkBoxField "grainesFeu" Nothing
    let personRes = Person <$> weaponMasteryRes 
                           <*> animalControlRes 
                           <*> curingRes 
                           <*> invisibilityRes 
                           <*> huntMasteryRes 
                           <*> pathsmanshipRes 
                           <*> psiSurgeRes 
                           <*> psiScreenRes 
                           <*> nexusRes 
                           <*> divinationRes
                           <*> epeeRes 
                           <*> arcRes 
                           <*> carquoisRes 
                           <*> cordeRes 
                           <*> potionLaumspurRes 
                           <*> poignardRes 
                           <*> lanterneRes 
                           <*> masseArmesRes 
                           <*> rationsSpecialesRes 
                           <*> grainesFeuRes
    let widget = do
            toWidget
                [lucius|
                |]
            [whamlet|
                #{extra}
                <fieldset id="disciplines">
                 <legend>Disciplines
                 <p>Choisir 3 disciplines:
                  <section class="left">
                   <section>
                    ^{fvInput weaponMasteryView}
                    <label for="weaponMastery">La science des armes
                   <section>
                    ^{fvInput animalControlView}
                    <label for="animalControl">Contrôle animal
                   <section>
                    ^{fvInput curingView}
                    <label for="curing">Science médical
                   <section>
                    ^{fvInput invisibilityView}
                    <label for="invisibility">Invisibilité
                   <section>
                    ^{fvInput huntMasteryView}
                    <label for="huntMastery">Art de la chasse
                  <section class="right">
                   <section>
                    ^{fvInput pathsmanshipView}
                    <label for="pathsmanship">Exploration
                   <section>
                    ^{fvInput psiSurgeView}
                    <label for="psiSurge">Foudroiement psychique
                   <section>
                    ^{fvInput psiScreenView}
                    <label for="psiScreen">Écran psychique
                   <section>
                    ^{fvInput nexusView}
                    <label for="nexus">Nexus
                   <section>
                    ^{fvInput divinationView}
                    <label for="divination">Intuition
                <fieldset id="objets">
                 <legend>Objets initiaux
                 <p>Choisir 5 objets:
                  <section>
                   ^{fvInput epeeView}
                   <label for="epee">Épée (Arme)
                  <section>
                   ^{fvInput arcView}
                   <label for="arc">Arc (Arme)
                  <section>
                   ^{fvInput carquoisView}
                   <label for="carquois">Carquois (Object spécial)
                  <section>
                   ^{fvInput cordeView}
                   <label for="corde">Corde (Object contenu dans le sac à dos)
                  <section>
                   ^{fvInput potionLaumspurView}
                   <label for="potionLaumspur">Potion de Laumspur (Objet contenu dans le sac à dos)
                  <section>
                   ^{fvInput poignardView}
                   <label for="poignard">Poignard (Arme)
                  <section>
                   ^{fvInput lanterneView}
                   <label for="lanterne">Lanterne (Object contenu dans le sac à dos)
                  <section>
                   ^{fvInput masseArmesView}
                   <label for="masseArmes">Masse d'armes (Arme)
                  <section>
                   ^{fvInput rationsSpecialesView}
                   <label for="rationsSpeciales">Trois rations spéciales (Repas)
                  <section>
                   ^{fvInput grainesFeuView}
                   <label for="grainesFeu">Trois graines de feu (Object spécial)
                <input type="submit" class="button" value="Jouer!">
            |]
    return (personRes, widget)

getInitJeuR :: Handler Html
getInitJeuR = do
((res, widget), enctype) <- runFormGet personForm
defaultLayout $ do
setTitle "Castle Death"
addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
toWidget [julius|
	$("#jeu").addClass("current");
|]
$(widgetFile "navigation")
$(widgetFile "personCreation")
$(widgetFile "footer")
$(widgetFile "main")


