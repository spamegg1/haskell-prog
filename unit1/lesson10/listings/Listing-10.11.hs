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
