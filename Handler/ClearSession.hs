module Handler.ClearSession where

import Import

getClearSessionR :: Handler ()
getClearSessionR = do
    deleteSession "LastPage"
    deleteSession "pointHabilete"
    deleteSession "pointEndurance"
    deleteSession "piecesOr"
    deleteSession "weaponMastery"
    deleteSession "animalControl"
    deleteSession "curing"
    deleteSession "invisibility"
    deleteSession "huntMastery"
    deleteSession "pathsmanship"
    deleteSession "psiSurge"
    deleteSession "psiScreen"
    deleteSession "nexus"
    deleteSession "divination"
    deleteSession "epee"
    deleteSession "arc"
    deleteSession "carquois"
    deleteSession "corde"
    deleteSession "potionLaumspur"
    deleteSession "poignard"
    deleteSession "lanterne"
    deleteSession "masseArmes"
    deleteSession "rationsSpeciales"
    deleteSession "grainesFeu"
    redirect InitJeuR
