type Robot t = ((String, Int, Int) -> t) -> t

robot :: (String, Int, Int) -> Robot t
robot (name, attack, hp) = \message -> message (name, attack, hp)

-- killerRobot = robot ("Kill3r", 25, 200)
