module Handler.InitJeu where

import Import

data Person = Person
    {weaponMastery    :: Maybe Bool
    ,animalControl    :: Maybe Bool
    ,curing           :: Maybe Bool
    ,invisibility     :: Maybe Bool
    ,huntMastery      :: Maybe Bool
    ,pathsmanship     :: Maybe Bool
    ,psiSurge         :: Maybe Bool
    ,psiScreen        :: Maybe Bool
    ,nexus            :: Maybe Bool
    ,divination       :: Maybe Bool
    ,epee             :: Maybe Bool
    ,arc              :: Maybe Bool
    ,carquois         :: Maybe Bool
    ,corde            :: Maybe Bool
    ,potionLaumspur   :: Maybe Bool
    ,poignard         :: Maybe Bool
    ,lanterne         :: Maybe Bool
    ,masseArmes       :: Maybe Bool
    ,rationsSpeciales :: Maybe Bool
    ,grainesFeu       :: Maybe Bool
    }deriving Show

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
                  <section .weapon>
                   ^{fvInput epeeView}
                   <label for="epee">Épée (Arme)
                  <section .weapon>
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
                  <section .weapon>
                   ^{fvInput poignardView}
                   <label for="poignard">Poignard (Arme)
                  <section>
                   ^{fvInput lanterneView}
                   <label for="lanterne">Lanterne (Object contenu dans le sac à dos)
                  <section .weapon>
                   ^{fvInput masseArmesView}
                   <label for="masseArmes">Masse d'armes (Arme)
                  <section>
                   ^{fvInput rationsSpecialesView}
                   <label for="rationsSpeciales">Trois rations spéciales (Repas)
                  <section>
                   ^{fvInput grainesFeuView}
                   <label for="grainesFeu">Trois graines de feu (Object spécial)
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

postInitJeuR :: Handler Html
postInitJeuR  = do
    ((result, widget), enctype) <- runFormPostNoToken personForm
    case result of
        FormSuccess person -> do
            case weaponMastery person of
                Just True -> setSession "weaponMastery" "yes"
                _ -> deleteSession "weaponMastery"
            case animalControl person of
                Just True -> setSession "animalControl" "yes"
                _ -> deleteSession "animalControl"
            case curing person of
                Just True -> setSession "curing" "yes"
                _ -> deleteSession "curing"
            case invisibility person of
                Just True -> setSession "invisibility" "yes"
                _ -> deleteSession "invisibility"
            case huntMastery person of
                Just True -> setSession "huntMastery" "yes"
                _ -> deleteSession "huntMastery"
            case pathsmanship person of
                Just True -> setSession "pathsmanship" "yes"
                _ -> deleteSession "pathsmanship"
            case psiSurge person of
                Just True -> setSession "psiSurge" "yes"
                _ -> deleteSession "psiSurge"
            case psiScreen person of
                Just True -> setSession "psiScreen" "yes"
                _ -> deleteSession "psiScreen"
            case nexus person of
                Just True -> setSession "nexus" "yes"
                _ -> deleteSession "nexus"
            case divination person of
                Just True -> setSession "divination" "yes"
                _ -> deleteSession "divination"
            case epee person of
                Just True -> setSession "epee" "yes"
                _ -> deleteSession "epee"
            case arc person of
                Just True -> setSession "arc" "yes"
                _ -> deleteSession "arc"
            case carquois person of
                Just True -> setSession "carquois" "yes"
                _ -> deleteSession "carquois"
            case corde person of
                Just True -> setSession "corde" "yes"
                _ -> deleteSession "corde"
            case potionLaumspur person of
                Just True -> setSession "potionLaumspur" "yes"
                _ -> deleteSession "potionLaumspur"
            case poignard person of
                Just True -> setSession "poignard" "yes"
                _ -> deleteSession "poignard"
            case lanterne person of
                Just True -> setSession "lanterne" "yes"
                _ -> deleteSession "lanterne"
            case masseArmes person of
                Just True -> setSession "masseArmes" "yes"
                _ -> deleteSession "masseArmes"
            case rationsSpeciales person of
                Just True -> setSession "rationsSpeciales" "yes"
                _ -> deleteSession "rationsSpeciales"
            case grainesFeu person of
                Just True -> setSession "grainesFeu" "yes"
                _ -> deleteSession "grainesFeu"
            sess <- getSession
            redirect $ PageR 1
        _ -> defaultLayout
            [whamlet|
                <p>Post form failed, let's try again.
                <form method=post action=@{InitJeuR} enctype=#{enctype}>
                    ^{widget}
                    <button>Submit
            |]