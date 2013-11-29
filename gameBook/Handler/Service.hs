module Handler.Service where

import Import
import Data.List (find)

data ContentElement = Paragraph Text | Image Text Bool | Battle Text Text Text | Throw Int | LossPoints Int Text deriving (Show, Read)

data Decision = Decision 
	{ nextPage :: Int
	, decisionText :: Text
	} deriving (Show, Read)

data Page = Page { paragraph :: [ContentElement],
                   decision :: [Decision]} 
                  deriving Show

instance ToJSON ContentElement where
     toJSON content = case content of
                        Paragraph t -> object ["p" .= t]
                        Image t b -> object ["image" .= object ["src" .= t]]
                        Battle t1 t2 t3 -> object ["battle" .= object ["enemy" .= t1,
                                                                       "habilete" .= t2,
                                                                       "endurance" .= t3]]
                        Throw i -> object ["throw" .= i]
                        LossPoints i t -> object["lossPoints" .= object ["lossPoint" .= i,
                                                                         "text" .= t]]

instance ToJSON Decision where
     toJSON (Decision nextPage decisionText) = object ["nextPage" .= nextPage,
                                                       "decisionText" .= decisionText]

instance ToJSON Page where
     toJSON (Page paragraph decision) = object ["paragraph" .= paragraph,
                                                "decision" .= decision]

getServiceR :: Int -> Handler Value
getServiceR id  = do 
     returnJson $ extraire $ find (condition id) pages
     where
       condition id (idPage, page) = id == idPage
      
       extraire Nothing = Page [] []
       extraire (Just (id,p)) = p



pages :: [(Int, Page)]
pages = [
      (1,Page [Paragraph "En attendant que sonne l'heure du départ, vous occupez les derniers moments qu'il vous reste à passer à Elzian à vérifier minutieusement tout votre équipement. Néanmoins, vous avez beau essayer de vous concentrer sur ces préparatifs, vous ne pouvez vous empêcher de penser continuellement à la ténébreuse forteresse de Kazan-Oud, telle qu'elle vous est apparue hier soir dans le puits de la Chambre du Conseil. Cette vision vous a laissé un sentiment de crainte et un sombre pressentiment vous étreint le cœur : qui sait si cet endroit maudit ne deviendra pas votre tombe ? Pourtant, au plus profond de vous-même, le désir de retrouver la Pierre de la Sagesse de Herdos l'emporte sur votre appréhension.",
               Paragraph "Peu avant le lever du jour, un léger coup frappé à votre porte vous tire subitement de vos pensées : c'est Rimoah qui vient vous chercher. Vous le suivez à travers un dédale de couloirs et de galeries sans fin, puis vous débouchez sur une plate-forme nichée au creux des tours majestueuses qui encadrent le Temple de la Vérité. Un jeune homme de fière allure vous y attend. 11 est grand, sa peau est mate, et son visage, encadré d'une auréole de cheveux blonds et soyeux, abrite des yeux au regard perçant comme celui d'un chat. 11 porte la tunique rouge et or des Vakeros, célèbres Magiciens- Guerriers de Dessi. « Salut à toi, Paido ! » dit Rimoah en s'inclinant légèrement devant le noble guerrier.",
               Paragraph "« Salut, ô Seigneur Rimoa, répond Paido. Tout est prêt pour le départ ! »",
               Paragraph "Les premiers rayons du soleil levant viennent éclairer les flancs argentés d'un magnifique vaisseau de l'espace qui plane au-dessus de vous. Tandis que s'élève le vrombissement sourd des puissants moteurs, vous remerciez Rimoah de son accueil et prenez congé de lui. Puis vous suivez Paido jusqu'à l'échelle d'embarquement située au bout de la plate-forme. Vous montez à bord et le vaisseau s'élève rapidement dans les airs, laissant derrière lui la silhouette de Rimoah qui disparaît bientôt derrière les tours rougeoyantes du Temple de la Vérité. Au cours de cette ascension, un magnifique spectacle s'offre à vos yeux : la ville d'Elzian s'étend à vos pieds avec ses toits aux mille nuances et l'enchevêtrement miroitant de ses nombreux canaux. Peu après, le vaisseau s'oriente cap au nord, vers la jungle qui occupe toute la région centrale de Dessi. Vous arrivez bientôt en vue de la faille de Gorgoron, qui déchire l'immensité vert émeraude de la forêt comme une sombre cicatrice. Paido vient alors vous rejoindre et commence à vous parler des habitants de ce pays sauvage et reculé. Grâce à lui, vous apprenez que les Anciens Mages sont les derniers représentants d'une illustre lignée de magiciens qui régnèrent sur les régions centrales du Magnamund, il y a plusieurs milliers d'années. Ces hommes sages et puissants connurent un règne glorieux qui prit hélas ! fin lorsqu'une épidémie de peste ravagea le pays et anéantit presque toute la population. Les quelques magiciens survivants trouvèrent refuge à Dessi où ils s'établirent définitivement, entre les montagnes et la jungle. Les Vakeros, quant à eux, sont des guerriers natifs de Dessi à qui les Anciens ont enseigné l'art combiné de la magie et du combat, afin qu'ils défendent la frontière nord du pays contre l'invasion de ses belliqueux voisins, les Vassagoniens.",
               Paragraph "Lorsque vous apprenez à Paido que vous avez dû vous-même livrer bataille à ces féroces guerriers du désert, vous sentez une grande tristesse le gagner. « Comme j'aimerais que mon frère Kasin soit parmi nous aujourd'hui, reprend-il en contemplant l'horizon avec mélancolie. Lui aurait pu nous raconter tout ce qu'il savait au sujet des guerres du désert... » Vous demandez à Paido ce qu'il est advenu de son frère. « Kazan-Oud ! » répond-il d'une voix étranglée.",
               Paragraph "Le pays de Dessi s'étend maintenant au-dessous de vous comme une gigantesque carte géographique. Au nord-ouest, vous apercevez les contreforts de la chaîne de Carcos et un long ruban argenté qui serpente à ses pieds : la Doï. A l'est, un amoncellement de nuages noirs avance inexorablement au- dessus de la jungle. C'est peu avant midi que vous apercevez enfin votre destination. Les bâtiments en coupole de Herdos se profilent à l'horizon, et vous distinguez dans le lointain les eaux du lac Khor, entourant l'îlot rocheux sur lequel se dresse Kazan-Oud. Même à cette distance, la vue de la sinistre silhouette de la forteresse vous fait froid dans le dos !",
               Paragraph "Paido ordonne à l'équipage de se préparer à atterrir et, dans l'heure qui suit, le majestueux vaisseau de l'espace projette son ombre sur la Grand-Place de Herdos. Quelques instants plus tard, vous êtes accueilli par le Seigneur Ardan, Ancien de Herdos, et par un détachement de gardes Vakeros. Ils vous escortent à travers les rues de la vieille cité, en passant par le quartier des pêcheurs et des mineurs aux petites maisons blanches et basses, jusqu'à un quai où se dresse une haute tour coiffée d'un dôme de verre, qui commande l'accès au port marchand. Au moment où vous entrez dans cette tour, vous remarquez que la coupole de verre émet une lumière verte qui se distingue très nettement malgré l'éclat aveuglant du soleil de midi.",
               Paragraph "Dans la soirée, alors que le soleil disparaît lentement derrière les sommets des monts Xulun, la lumière émanant de la tour devient encore plus intense et semble coiffer le lac Khor d'une ombrelle de luminescence fantomatique. Le Seigneur Ardan vous en donne l'explication : « Cette tour, ainsi que les cinq autres qui encadrent le lac, est génératrice d'une énergie magique qui forme un écran autour de Kazan-Oud. Nulle créature, qu'elle soit vivante ou non, ne peut entrer ni quitter l'île de Khor tant que notre bouclier protecteur demeure intact. Comme nous n'osons relâcher notre défense, fût-ce pour quelques minutes, nous avons trouvé le moyen de vous faire traverser, sain et sauf, cet écran. » Sur ces mots, Paido sort de sa poche une gemme de la taille d'une petite pomme, qu'il dépose au creux de votre main. La pierre est rouge, translucide, mais elle renferme en son milieu une brume tourbillonnante, zébrée d'étincelles d'or et d'argent.",
               Paragraph "« Ceci est une Clé de Pouvoir, explique Paido. Gardez-la précieusement car tant qu'elle sera en votre possession, il vous sera possible d'achever votre quête. Mais attention! si vous deviez la perdre, vous ne pourriez plus jamais vous échapper de l'île de Khor. » (Inscrivez la Clé de Pouvoir dans la case Objets Spéciaux de votre Feuille d'Aventure, puis mettez-la dans une de vos poches.) « A minuit, reprend Paido, mes Vakeros vous conduiront en bateau jusqu'au seuil de l'écran magique. Vous partirez ensuite à bord d'un petit canot grâce auquel vous pourrez traverser l'écran et gagner l'île de Khor. Nous prierons pour vous, Loup Solitaire ! »",
               Paragraph "Lorsque sonnent les douze coups de minuit, vous vous trouvez sur le pont d'un bateau de pêche. Le mugissement du vent dans les voiles et le grincement des cordages et des agrès sont les seuls sons qui vous accompagnent sur les eaux noires du lac Khor. Vous arrivez bientôt au pied d'un mur de lumière verte : c'est le bouclier de défense que Paido vous a décrit. Les Vakeros vous chuchotent au revoir et, après avoir sauté dans le canot, vous franchissez l'écran, vous rapprochant un peu plus à chaque coup de rame de l'île sinistre qui abrite la forteresse tant redoutée.",
               Paragraph "A trois cents mètres de la rive, vous observez que vous pouvez mettre pied à terre à deux endroits."] 
              [Decision 135 "Si vous désirez débarquer sur la jetée en pierre qui s'étend à l'ouest de Kazan-Oud,",
               Decision 288 "Si vous préférez accoster dans une petite crique bien abritée, à l'est de Kazan-Oud,"]),
      (121,Page [Paragraph "Le tentacule vous arrache du sol et, de seconde en seconde, resserre son étreinte jusqu'à ce que vous puissiez à peine respirer. Soudain, vous vous sentez précipité vers un autre bloc de rocher qui s'ouvre en deux pour découvrir une monstrueuse mâchoire dégoulinante de salive. La chose vous engloutit en un clin d'œil.",
                 Paragraph "Votre vie et votre aventure se terminent, hélas, ici.",
                 Image "gameover.jpg" False] 
                []),
      (135,Page [Paragraph "A la lumière d'un violent éclair vert, vous apercevez le toit éventré de Kazan-Oud ; l'espace d'une fraction de seconde, vous avez l'impression d'avoir sous les yeux la carcasse d'un gigantesque lézard. Un second éclair vient illuminer les nombreuses fenêtres du donjon qui semblent vous dévisager, comme de grands yeux creux bordés d'éclats de vitres brisées. Les remparts de pierre noire s'ornent d'une rangée de gargouilles en surplomb de la jetée ; les têtes grimaçantes tiennent chacune dans leur gueule un anneau de fer rouillé d'où partent de longues cordes souillées de limon qui se balancent mollement au gré des vagues. Le long de la jetée, l'eau est assez profonde pour permettre à un gros vaisseau d'ancrer, mais les courants de fond et la force de la marée rendent l'approche difficile pour un frêle esquif tel que le vôtre.",
                 Paragraph "Vous réalisez soudain avec effroi que la houle menace de vous écraser d'un moment à l'autre contre la jetée."] 
                [Decision 135 "Si vous maîtrisez la <i>Discipline Magnakaï de l'<span>Intuition</span></i>,",
                 Decision 203 "Si vous voulez cesser de ramer pour essayer d'attraper l'une des cordes qui pendent,",
                 Decision 325 "Si vous préférez abandonner votre bateau et vous jeter à l'eau pour gagner à la nage un banc de rochers un peu plus loin, à l'ouest,"]),
      (158,Page [Paragraph "Suffoqué par le manque d'oxygène, vous remontez péniblement à la surface et nagez vers le rivage. Vous vous hissez ensuite hors de l'eau et vous affalez, plus mort que vif, près d'un groupe de rochers à moitié enterrés dans le sable noir de la plage. Au cours de cette baignade forcée, vous avez perdu deux Objets de votre Sac à Dos, et l'eau polluée a abîmé toutes vos Provisions (rayez tous les Repas de votre Feuille d'Aventure, ainsi que deux Objets de Sac à Dos)",
                 Throw 2,
                 Paragraph "À peine avez-vous eu le temps de reprendre votre souffle qu'un grattement sonore se fait entendre, comme si on traînait quelque chose de très lourd entre les rochers. Soudain, une fissure verticale apparaît à la surface du rocher qui se trouve juste à votre gauche ; il en jaillit un faisceau de lumière jaune qui se pose sur vous. Ce n'est pas un rocher, mais un œil énorme !"] 
                [Decision 265 "Si vous voulez dégainer votre arme et attaquer la monstrueuse pupille,",
                 Decision 41 "Si vous préférez vous remettre debout et fuir vers l'à-pic rocheux qui soutient Kazan-Oud,"]),
      (203,Page [Paragraph "Les mains tremblantes, vous serrez la corde verte le plus fort possible tout en essayant de bloquer vos pieds pour ne pas glisser dans les énormes vagues qui rugissent en dessous. La coque en bois craque dans la nuit, puis le bateau est rapidement englouti sans laisser de trace. Soudain, une brusque secousse parcourt toute la longueur de la corde, et une espèce de tête de serpent surgit des eaux noires.",
                 Image "monster_big_serpent.png" True,
                 Paragraph "Elle se dresse en ondulant, et les mâchoires grandes ouvertes laissent voir de longs crochets jaunes aiguisés comme des couteaux. L'ignoble tête vous fixe de ses yeux blancs et aveugles, prête à attaquer. Vous comprenez alors avec effroi que vous vous cramponnez, en réalité, au corps d'un redoutable Lekhor !"] 
                [Decision 325 "Si vous souhaitez lâcher le corps du serpent et plonger dans les eaux noires,",
                 Decision 76 "Si vous préférez tirer une arme pour vous défendre contre son attaque venimeuse,"]),
      (265,Page [Paragraph "Vous plongez votre arme dans l'œil monstrueux, et une substance fluorescente et gélatineuse s'écoule de la blessure. Un affreux cri de douleur s'élève alors du sol sous vos pieds, et des jets de vapeur jaillissent en sifflant à travers le sable.",
                 Image "monster_luminous_jelly.png" True,
                 LossPoints 2 "Vous reculez en essayant de protéger vos yeux du cinglant nuage de sable qui tourbillonne autour de vous, mais un coup inattendu dans les jambes vous fait perdre l'équilibre et vous tombez de tout votre long sur le sol",
                 Paragraph "Vous reculez en essayant de protéger vos yeux du cinglant nuage de sable qui tourbillonne autour de vous, mais un coup inattendu dans les jambes vous fait perdre l'équilibre et vous tombez de tout votre long sur le sol (vous perdez 2 points d'ENDURANCE).",
                 Paragraph "Avant que vous puissiez vous relever, un tentacule vert, recouvert de verrues, s'enroule lentement autour de votre taille et vous tire lentement vers l'œil mutilé."] 
                [Decision 190 "Si vous maîtrisez la <i>Discipline Magnakaï du <span>Foudroiement Psychique</span></i> et si vous souhaitez l'utiliser,",
                 Decision 121 "Si vous ne maîtrisez pas cette discipline ou si vous ne voulez pas l'utiliser,"]),
      (288,Page [Paragraph "Vous apercevez maintenant les tours et la muraille de la sinistre forteresse, rendue plus menaçante encore par les violents éclairs de lumière verte qui déchirent le ciel et le grondement sourd du tonnerre dans le lointain. Un grand nombre de toits, de tourelles sont en ruine, et leurs décombres calcinés donnent l'impression que la forteresse a été ravagée par un incendie.",
                 Paragraph "Vous vous approchez de la petite crique en forme de fer à cheval, bien abritée au milieu de rochers noirs et déchiquetés. Au milieu de deux d'entre eux, vous remarquez un creux asséché près du rivage. Cet endroit est une cachette idéale pour votre petit bateau. Silencieusement, vous sautez du coracle et vous le tirez sur la plage vers les rochers. Mais tout à coup, vous apercevez de minuscules lumières rouges qui dansent dans l'ombre, au pied de la forteresse. Vous vous arrêtez net et, quelques secondes plus tard, vous entendez des petits cris aigus et étouffés.",
                 Paragraph "Un éclair illumine soudain la baie, et vous apercevez des centaines de rats aux yeux rouges, très maigres mais tous de la taille d'un petit chien. Ils ont l'air affamé et courent sur la plage dans votre direction, tel un furieux torrent d'eau noire. Des gouttes de sueur commencent à perler sur votre front, et votre cœur bat à tout rompre : vous devez trouver rapidement un moyen d'échapper à cette horde hurlante et féroce de rongeurs voraces."] 
                [Decision 336 "Si vous souhaitez escalader les rochers et fuir le long d'une plage déserte",
                 Decision 117 "Si vous voulez remettre votre bateau à l'eau et pagayer loin de la baie",
                 Decision 45 "Si vous préférez rester où vous êtes pour combattre le flot de rats géants qui se précipite sur vous"]),
      (325,Page [Paragraph "Vous tombez au milieu des vagues et coulez comme une pierre. L'étreinte glaciale des eaux du lac engourdit vos muscles, et ses senteurs âcres et piquantes vous remplissent la bouche. Votre premier réflexe en pénétrant dans l'eau est de nager, mais vous en êtes empêché par toute une végétation aquatique qui s'enroule autour de vos membres. Manquant désespérément d'air, vous essayez rageusement de vous arracher aux algues qui menacent maintenant de vous entraîner au fond de l'eau.",
                 Paragraph "Combattez de la manière habituelle. Cependant, à cause du manque d'air, vous devrez automatiquement déduire 2 points d'ENDURANCE à chaque Assaut.",
                 Battle "ALGUES NOIRES DU LAC" "10" "50"] 
                [Decision 158 "Si vous sortez vivant de cette lutte,"])]

