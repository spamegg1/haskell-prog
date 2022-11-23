type Robot t = ((String, Int, Int) -> t) -> t

robot :: (String, Int, Int) -> Robot t
robot (name, attack, hp) = \message -> message (name, attack, hp)

name :: (String, Int, Int) -> String
name (n, _, _) = n

attack :: (String, Int, Int) -> Int
attack (_, a, _) = a

hp :: (String, Int, Int) -> Int
hp (_, _, h) = h

getName :: Robot String -> String
getName aRobot = aRobot name

getAttack :: Robot Int -> Int
getAttack aRobot = aRobot attack

getHP :: Robot Int -> Int
getHP aRobot = aRobot hp

-- GHCi> getAttack killerRobot
-- 25
-- GHCi> getHP killerRobot
-- 200
