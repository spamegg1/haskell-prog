-- I did this without learning about type classes and the differences
-- between type, data, newtype. The functions here work without Rank2Types,
-- but winner and threeRoundFight are impossible without Rank2Types.
-- This could probably be redone better with knowledge from Unit2 and
-- the rest of the book.

{-# LANGUAGE Rank2Types #-}
module Robots where

--type Robot t = ((String, Int, Int) -> t) -> t
type Robot t = forall t. ((String, Int, Int) -> t) -> t

robot :: (String, Int, Int) -> Robot t
robot (name, attack, hp) = \message -> message (name, attack, hp)


-- helpers
name :: (String, Int, Int) -> String
name (n, _, _) = n

attack :: (String, Int, Int) -> Int
attack (_, a, _) = a

hp :: (String, Int, Int) -> Int
hp (_, _, h) = h


-- getters
getName :: Robot String -> String
getName aRobot = aRobot name

getAttack :: Robot Int -> Int
getAttack aRobot = aRobot attack

getHP :: Robot Int -> Int
getHP aRobot = aRobot hp


-- setters
setName :: Robot (Robot t) -> String -> Robot t
setName aRobot newName = aRobot (\(_,a,h) -> robot (newName,a,h))

setAttack :: Robot (Robot t) -> Int -> Robot t
setAttack aRobot newAttack = aRobot (\(n,_,h) -> robot (n,newAttack,h))

setHP :: Robot (Robot t) -> Int -> Robot t
setHP aRobot newHP = aRobot (\(n,a,_) -> robot (n,a,newHP))


-- printing
printRobot :: Robot String -> String
printRobot aRobot = aRobot (\(n,a,h) ->
    n ++ " attack:" ++ (show a) ++ " hp:"++ (show h))


-- fighting
damage :: Robot (Robot t) -> Int -> Robot t
damage aRobot attackDamage = aRobot (\(n,a,h) -> robot (n,a,h-attackDamage))

fight :: Robot Int -> Robot (Robot t) -> Robot t
fight aRobot defender = damage defender attackDamage
    where attackDamage = if getHP aRobot > 10 then getAttack aRobot else 0
