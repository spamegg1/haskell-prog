-- fastRobot = robot ("speedy", 15, 40)
-- slowRobot = robot ("slowpoke", 20, 30)
-- slowRobotRound1 = fight fastRobot slowRobot
-- fastRobotRound1 = fight slowRobotRound1 fastRobot
-- slowRobotRound2 = fight fastRobotRound1 slowRobotRound1
-- fastRobotRound2 = fight slowRobotRound2 fastRobotRound1
-- slowRobotRound3 = fight fastRobotRound2 slowRobotRound2
-- fastRobotRound3 = fight slowRobotRound3 fastRobotRound2
-- GHCi> printRobot fastRobotRound3
-- "speedy attack:15 hp:20"
-- GHCi> printRobot slowRobotRound3
-- "slowpoke attack:20 hp:-15"