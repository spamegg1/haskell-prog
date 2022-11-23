import qualified Data.Map as Map
type UserName = String
type GamerId = Int
type PlayerCredits = Int
type WillCoId = Int

-- This Map represents the database you’re getting your UserName from,
-- given a GamerId.
userNameDB :: Map.Map GamerId UserName
userNameDB = Map.fromList [
    (1,"nYarlathoTep"),
    (2,"KINGinYELLOW"),
    (3,"dagon1997"),
    (4,"rcarter1919"),
    (5,"xCTHULHUx"),
    (6,"yogSOThoth")]

-- This Map represents the database; you’ll use the UserName to look up
-- PlayerCredits.
creditsDB :: Map.Map UserName PlayerCredits
creditsDB = Map.fromList [
    ("nYarlathoTep",2000),
    ("KINGinYELLOW",15000),
    ("dagon1997",300),
    ("rcarter1919",12),
    ("xCTHULHUx",50000),
    ("yogSOThoth",150000)]

gamerIdDB :: Map.Map WillCoId GamerId
gamerIdDB = Map.fromList [
    (1001,1),
    (1002,2),
    (1003,3),
    (1004,4),
    (1005,5),
    (1006,6)]

lookupGamerId :: WillCoId -> Maybe GamerId                           -- a -> f b
lookupGamerId id = Map.lookup id gamerIdDB

lookupUserName :: GamerId -> Maybe UserName                          -- b -> f c
lookupUserName id = Map.lookup id userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits                     -- c -> f d
lookupCredits username = Map.lookup username creditsDB
