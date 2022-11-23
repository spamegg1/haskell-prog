import qualified Data.Map as Map
type UserName = String
type GamerId = Int
type PlayerCredits = Int

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

lookupUserName :: GamerId -> Maybe UserName
lookupUserName id = Map.lookup id userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits
lookupCredits username = Map.lookup username creditsDB

altLookupCredits :: Maybe UserName -> Maybe PlayerCredits
altLookupCredits Nothing = Nothing
altLookupCredits (Just username) = lookupCredits username

--creditsFromId :: GamerId -> Maybe PlayerCredits
