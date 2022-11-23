type Robot t = ((String, Int, Int) -> t) -> t

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

-- killerRobot = robot ("Kill3r",25,200)
-- gentleGiant = robot ("Mr. Friendly", 10, 300)
-- gentleGiantRound1 = fight killerRobot gentleGiant
-- killerRobotRound1 = fight gentleGiant killerRobot
-- gentleGiantRound2 = fight killerRobotRound1 gentleGiantRound1
-- killerRobotRound2 = fight gentleGiantRound1 killerRobotRound1
-- gentleGiantRound3 = fight killerRobotRound2 gentleGiantRound2
-- killerRobotRound3 = fight gentleGiantRound2 killerRobotRound2
-- GHCi> printRobot gentleGiantRound3
-- "Mr. Friendly attack:10 hp:225"
-- GHCi> printRobot killerRobotRound3
-- "Kill3r attack:25 hp:170"
