{-# LANGUAGE FlexibleInstances, UndecidableInstances, OverlappingInstances #-}

module Handler.Page where

import Import
import Data.Text

data Page = Page Int Widget

findPageText :: [Page] -> Int -> Widget
findPageText ((Page a b):xs) y = if a == y then b else findPageText xs y
findPageText [] _ = [whamlet|<h1> La Page n'existe pas|]

page1 :: Widget
page1 = [whamlet|<section id="story">
    <p>The hours leading up to your departure from Elzian are spent checking and double-checking your equipment and provisions. But, no matter how hard you try to concentrate on these preparations, your mind is constantly invaded by the shadowy image of Kazan-Oud, an image identical to the vision that appeared the previous evening in the well of the council chamber. You are filled with a deep dread, as you contemplate the probable site of your own grave. However, coupled to this terrible sense of foreboding is a far greater and irresistible desire to discover the Lorestone of Herdos.

    <p>Shortly before dawn, your thoughts are disturbed by a knock at the door of your chamber: it is Rimoah. The time has come for your mission to begin. You follow him through halls and galleries to a rooftop platform nestling among the crimson towers of the Temple of Truth. Here you are greeted by a young man. He is tall and dark-skinned, with plaited flaxen hair and sharp, cat-like eyes, and he wears the gold and scarlet tunic of a Vakeros—a warrior-magician of Dessi. ‘Hail, Paido!’ says Rimoah, bowing to this proud young man.

    <p>‘Hail, my Lord Rimoah,’ he replies, respectfully. ‘We are ready to sail.’

    <p>The first rays of the dawn light shimmer along the golden hull of a magnificent skyship that hovers above the rooftop platform. As the hum of its powerful engine rises, you thank Rimoah and bid him farewell before following Lord Paido to the boarding ladder at the edge of the platform. Once safely on board, the skyship rises into the chill dawn air, and Lord Rimoah and the Tower of Truth shrink swiftly beneath its golden keel. You look down with growing fascination as the sleek, bat-winged craft passes over the circling waters of the Elzian Canal and speeds northwards above the jungle of central Dessi. As the grey Chasm of Gorgoron looms into view, splitting the emerald-green land like a deep and terrible wound, Lord Paido joins you at the rail. Time passes in conversation, and you learn much about the people of this untamed land and their history. You learn that the Elder Magi are all that remain of a race of great magicians who ruled central Magnamund many thousands of years ago. They were wise and powerful, and their leadership was great until their numbers were decimated by a plague that swept across the world. Those who survived sought refuge in Dessi and have lived here, in the mountains and the jungle, ever since. The Vakeros are native soldiers of Dessi who have been taught the art of battle-magic by the Elder Magi to help them defend the northern border against invasion by the war-like Vassagonians.

    <p>When you tell Lord Paido of your own past battles with the desert warriors, you sense a sadness within him. ‘How I wish my brother Kasin were here with us now,’ he says, staring thoughtfully towards the distant horizon. ‘He could tell many a brave tale of the great desert wars.’ You ask what has become of his brother. There is a long pause before he replies solemnly: ‘Kazan-Oud.’

    <p>The land of Dessi is now spread out beneath you like a gigantic map. To the northwest you can see the foothills of the Carcos Range and a faint ribbon-like glimmer that is the River Doi; to the east, a bank of grey storm clouds advances unchecked across a sea of jungle vegetation. Shortly before noon you sight your destination. The low-domed buildings of Herdos appear on the horizon, followed by the waters of Lake Khor and a blackened finger of rock upon which sits Kazan-Oud. Even at this great distance, the awesome sight of the terrible fortress sends a chill along your spine.

    <p>Lord Paido orders his crew to prepare for landing, and within the hour, the great skyship is casting its shadow upon the flagstones of the Plaza of Herdos. You are welcomed by Lord Ardan, Elder of Herdos, and a detachment of his Vakeros guards. They escort you through the streets of the ancient town, past the tiny stone-walled dwellings of fishermen and miners, to a quay where a glass-domed tower several storeys high commands access to the busy harbour. As you enter the tower, you notice that the glass dome radiates a greenish light that, in spite of the blinding glare of the midday sun, can be seen quite clearly.

    <p>Later, as the sun sinks slowly behind the peaks of the mountains, the light emanating from the tower becomes more visible, covering Lake Khor with an umbrella of ghostly luminescence. Lord Ardan explains: ‘This tower, together with five others that encircle the lake, generates a shield of magical energy that imprisons the evil of Kazan-Oud. No creature, living or dead, can enter or leave the Isle of Khor so long as our shield remains intact. We dare not lower our guard, and, to allow you to land on the island, we have devised a means by which you may pass through the shield unharmed.’ He takes a gem the size of a small apple from the pocket of his silken robe and places it in your hand. It is a dull translucent red, but within its core a swirling mist of glittering sparks flickers with gold and silver fire.

    <p>‘It is a Power-key. Guard it well, for so long as you possess it you may fulfil your quest; lose it and you will never escape from the Isle of Khor.’ (Mark the Power-key on your Action Chart as a Special Item, which you carry in the pocket of your tunic.) ‘At midnight, my Vakeros will take you by boat to the edge of the shield. On board is a small coracle in which you can pass through the shield and make your way to the Isle of Khor. We shall pray for you, Lone Wolf.’

    <p>Midnight finds you standing on the deck of a square-rigged fishing boat. The sighing night wind and the creak of rope and timber are the only sounds that accompany you across the black waters of Lake Khor. You arrive at a wall of shimmering, green light: the power-shield. The Vakeros whisper their goodbyes, and you paddle through the wall, drawing closer with every stroke to the sinister island fortress.

    <p>Two hundred yards from the glistening black shoreline, you note two places where you can make a landing.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you wish to land at a stone jetty to the west of Kazan-Oud, 
                <a href="@{PageR 135}">turn to 135.
            <p>If you wish to land at a sheltered bay to the east of Kazan-Oud, 
                <a href="@{PageR 288}">turn to 288.|]

page135 :: Widget
page135 = [whamlet|<section id="story">
    <p>A streak of green, forked lightning lights up the collapsed roof of Kazan-Oud, and for a second, it looks like the shattered ribs of a giant lizard. There is another flash of lightning, and a hundred tower windows glare at you like empty eyes edged with slivers of broken glass. A line of carved stone gargoyles adorns the black stone walls, overhanging the jetty. Rings of rusted iron are clamped in their snarling jaws, each wound round with slime-encrusted ropes that dangle in the water. At the jetty, it is deep enough to allow a large vessel to dock, but the current and the swell of the tide make it increasingly difficult for you to control your tiny boat.

    <p>Your stomach tightens as the swell threatens to dash you against the jetty.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you have the <i name="divination">Magnakai Discipline of Divination</i>, 
                <a href="@{PageR 135}">turn to 57.
            <p>If you wish to stop paddling and try to grab one of the ropes, 
                <a href="@{PageR 203}">turn to 203.
            <p>If you decide to abandon the boat and swim towards a line of rocks further west, 
                <a href="@{PageR 325}">turn to 325.|]

page121 :: Widget
page121 = [whamlet|<section id="story">
    <p>The tentacle lifts you into the air, tightening its grip with each passing second until almost all the breath is squeezed from your lungs. Suddenly you are hurled towards another massive boulder, which opens to reveal a monstrous jaw dripping with loathsome saliva. You are swallowed whole.

    <p>Your life and your quest ends here...
    <img id="gameover" src="../../static/img/gameover.jpg" />|]

page158 :: Text -> Widget
page158 txt = [whamlet|<section id="story">
    <p>Gasping for air, you claw your way to the surface and swim for the rocky shore. Heaving yourself from the cold water, you crouch down, breathless and exhausted, beside a line of huge boulders, half-buried in the coal-black sand, and take stock of your belongings. You have lost two items from your Backpack, and all the food has been ruined by the tainted water (erase all Meals and two Backpack Items of your choice from your Action Chart).        
    
    <section id="jeterObjets">
        <form method="post" action=@{JeterObjetsR}>
            <fieldset>
                <legend>Choisir 2 Items À Jeter...
                <input type="checkbox">
                <label>#{txt1}
                <input type="checkbox">
                <label>#{txt2}
                <input type="checkbox">
                <label>#{txt3}
                <input type="checkbox">
                <label>#{txt4}
                <input type="checkbox">
                <label>#{txt5}
                <input type="hidden" name="keys" id="keys" value="">
                <input type="hidden" name="pageToGo" id="pageToGo" value="">
        <button class="button">Jeter!

    <p>No sooner have you managed to control your breathing than you hear the sound of scraping, as if some heavy weight were being dragged across the rocks to your left. A vertical crack appears in the surface of the nearest boulder, and a sickly yellow light washes over you. It is not a boulder—you are staring at a huge eye.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you wish to draw your weapon and attack the eye, 
                <button class="btnLikeLink" id="P265">turn to 265.
            <p>If you wish to leap to your feet and escape towards the sheer rock base of Kazan-Oud, 
                <button class="btnLikeLink" id="P41">turn to 41.|]
    where listTxt = Import.concat[splitOn (pack "|") txt,["","","","",""]]
          txt1 = listTxt !! 0
          txt2 = listTxt !! 1
          txt3 = listTxt !! 2
          txt4 = listTxt !! 3
          txt5 = listTxt !! 4

page203 :: Widget
page203 = [whamlet|<section id="story">

    <p>With your trembling hands clasped tightly around the slippery green rope, you fight to lock your feet together to prevent yourself from sliding into the heaving swell. The crack of splintering wood fills the night as the coracle shatters and sinks without trace.

    <img src="../../static/img/monster_big_serpent.png" class="monster" />

    <p>A sudden jolt runs the length of the rope, and a snaky head rises from the black water. It dips and swerves upwards, opening its jaws, set with fangs like long yellow knives, and fixing you with its blind white eyes. You are clinging to the body of a deadly Lekhor that is poised to strike.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you wish to release your grip of this deadly serpent and dive into the water, 
                <a href="@{PageR 325}">turn to 325.
            <p>If you wish to draw a weapon and defend yourself against its venomous attack, 
                <a href="@{PageR 76}">turn to 76.|]

page325 :: Widget
page325 = [whamlet|<section id="story">
            <p>You strike the seething water with a mighty splash and sink like a stone. The sharp tang of the lake fills your mouth, and its icy cold embrace numbs your muscles. Your first impulse on hitting the water is to lash out with your arms and swim, but you are hampered by a mass of plant life that coils around your flailing limbs. Desperate for air, you hack blindly at the weeds that now threaten to drag you to a watery grave.

            <p>Fight the combat as normal. However, due to your lack of air, you must automatically deduct 2 ENDURANCE points for every round that you fight.

            <section id="combat">
                <p id="monster_name">
                    <strong>Black Lakeweed:
                    COMBAT SKILL
                    <span id="pnt_attaque_monstre">10 
                    ENDURANCE 
                    <span id="pnt_endurance_monstre">50

                <section class="choixCombat">
                        <button id="combattre" class="button">COMBATTRE
                        <button id="fuir" class="button">fuir
                <form method="post" id="lossPnt" action=@{PerdrePointR}>
                    <input type="hidden" name="pntToLose" id="pntToLose" value=0>
                    <input type="hidden" name="pageToGo" id="pageToGo" value=158>

            <section id="decisionCombat">
                <img src="../../static/img/decision.png" />
                <div>
                    <p>If you survive the struggle, 
                        <button class="btnLikeLink" id="P158">turn to 158.|]

page265 :: Widget
page265 = [whamlet|<section id="story">
    <p>You plunge your weapon into the monstrous eye and gouts of a luminous jelly-like substance pour from the wound. A ghastly inhuman scream of pain rises from the ground beneath your feet. Jets of hissing steam erupt through the sand, and a stinging cloud of grit assails your eyes.

    <img src="../../static/img/monster_luminous_jelly.png" class="monster" />
    <p class="situation">You reel backwards, shielding your face from the blast, but an unexpected blow to your legs sends you sprawling to the ground (lose 
        <span id="lifeLost">2 #
        ENDURANCE points).
        <button id="confirmLossPnt" class="button">Confirmer
    <form method="post" id="lossPnt" action=@{PerdrePointR}>
        <input type="hidden" name="pntToLose" id="pntToLose" value="2">
        <input type="hidden" name="pageToGo" id="pageToGo" value="">

    <p>Before you can rise, a warty, green tentacle coils round your waist and pulls you slowly towards the mutilated eye.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you have the 
                <i name="psiSurge">Magnakai Discipline of Psi-surge #
                and wish to use it, 
                <button class="btnLikeLink" id="P190">turn to 190.

            <p>If you do not possess this skill, or if you do not wish to use it, 
                <button class="btnLikeLink" id="P121">turn to 121.|]

page288 :: Widget
page288 = [whamlet|<section id="story">
    <p>Vivid green flashes of forked lightning and the rumble of distant thunder add menace to the towers and sheer stone walls of Kazan-Oud. Many of the roofs and turrets are in ruin; their twisted beams and floors lie open to the sky, giving the fortress a burnt-out and deserted appearance.

    <p>As you approach the tiny bay, which is tucked inside the shelter of a horseshoe reef of jagged black rocks, your eye is caught by the glow of tiny red lights, moving in the shadows at the base of the fortress wall. You notice a dry hollow among a group of rocks close to the shore that offers an ideal hiding place for your little boat. Silently, you disembark and drag the coracle up the beach towards the rocks. Seconds later you are halted dead in your tracks by the sound of muffled squealing. Sweat breaks out on your brow when a flash of lightning reveals scores of small red eyes close to the sand. A seething flood of rats, each as large as a puppy but gaunt and half-starved, is scurrying down the beach towards you like a torrent of black water.

    <p>With pounding heart, you search for some means of escape from this ravenous horde of squealing, snapping rodents.

    <section id="decision">
        <img src="../../static/img/decision.png" />
        <div>
            <p>If you wish to climb over the rocks and escape across a deserted beach, 
                <a href="@{PageR 336}">turn to 336.
            
            <p>If you wish to drag your little boat back into the lake and paddle away from the bay,
                <a href="@{PageR 117}">turn to 117.
            
            <p>If you prefer to stand and fight the onrushing flood of giant rats, 
                <a href="@{PageR 45}">turn to 45.|]    


pages :: [Page]
pages = [Page 1 (toWidget page1), Page 135 (toWidget page135), Page 121 (toWidget page121), Page 158 (toWidget $ page158 ""), Page 203 (toWidget page203),Page 325 (toWidget page325), Page 265 (toWidget page265), Page 288 (toWidget page288)]

class Nothingish a where
    value :: a
instance Nothingish (Maybe a) where
    value = Nothing
instance Nothingish Text where
    value = ""

eliminate :: (Nothingish a) => Maybe a -> a
eliminate (Just a) = a
eliminate Nothing  = value

addDisObj:: Maybe Text -> Text -> Text
addDisObj Nothing a = a
addDisObj (Just a) b = append b a

getPageR :: Int -> Handler Html
getPageR pagedId = do
    setSession (pack "LastPage") $ pack (show pagedId)
    defaultLayout  $ do
        setTitle "Castle Death"
        addScriptRemote "//code.jquery.com/jquery-1.10.1.js"
        pointHabilete <- lookupSession "pointHabilete"
        pointEndurance <- lookupSession "pointEndurance"
        piecesOr <- lookupSession "piecesOr"
        let pntHabilete = eliminate pointHabilete
        let pntEndurance = eliminate pointEndurance
        let pOr = eliminate piecesOr
        weaponMastery <- lookupSession "weaponMastery"
        animalControl <- lookupSession "animalControl"
        curing <- lookupSession "curing"
        invisibility <- lookupSession "invisibility"
        huntMastery <- lookupSession "huntMastery"
        pathsmanship <- lookupSession "pathsmanship"
        psiSurge <- lookupSession "psiSurge"
        psiScreen <- lookupSession "psiScreen"
        nexus <- lookupSession "nexus"
        divination <- lookupSession "divination"
        let disciplines = addDisObj divination $ addDisObj nexus $ addDisObj psiScreen $ addDisObj psiSurge $ addDisObj pathsmanship $ addDisObj huntMastery $ addDisObj invisibility $ addDisObj curing $ addDisObj animalControl $ addDisObj weaponMastery ""
        let [dis1,dis2,dis3,videDis] = splitOn (pack "|") disciplines
        epee <- lookupSession "epee"
        arc <- lookupSession "arc"
        carquois <- lookupSession "carquois"
        corde <- lookupSession "corde"
        potionLaumspur <- lookupSession "potionLaumspur"
        poignard <- lookupSession "poignard"
        lanterne <- lookupSession "lanterne"
        masseArmes <- lookupSession "masseArmes"
        rationsSpeciales <- lookupSession "rationsSpeciales"
        grainesFeu <- lookupSession "grainesFeu"
        let objets = addDisObj grainesFeu $ addDisObj rationsSpeciales $ addDisObj masseArmes $ addDisObj lanterne $ addDisObj poignard $ addDisObj potionLaumspur $ addDisObj corde $ addDisObj carquois $ addDisObj arc $ addDisObj epee ""
        let objs = Import.concat[splitOn (pack "|") objets,["","","","",""]]
        let obj1 = objs !! 0
        let obj2 = objs !! 1
        let obj3 = objs !! 2
        let obj4 = objs !! 3
        let obj5 = objs !! 4
        toWidget [whamlet|
            <header>
                <nav>
                    <ul>
                        <li>
                            <a id="accueil" href=@{AccueilR}>Accueil
                        <li>
                            <a id="jeu" class="current" @{InitJeuR}>Jeu
                        <li>
                            <a id="regleJeu" href=@{ReglesR}>Règle du jeu
                <img src="../../static/img/castle_death_logo.png" />
                <p id="pageNumber">#{pagedId}
        |]
        case pagedId of
            158 -> page158 objets
            pId -> findPageText pages pId
        $(widgetFile "defaultPage")
        $(widgetFile "footer")
        $(widgetFile "main")
        $(widgetFile "combat")


postPageR :: Int -> Handler Html
postPageR  = error "Not yet implemented: postPageR"
