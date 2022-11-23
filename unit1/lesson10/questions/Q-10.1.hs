-- Q10.1
-- Use map on a list of robot objects to get the life of each robot in the list.

import Robots

-- Answer:
-- Prelude> :l Q-10.1.hs
-- [1 of 1] Compiling Main             ( Q-10.1.hs, interpreted )
-- Ok, one module loaded.
-- *Main> fastRobot = robot ("speedy", 15, 40)
-- *Main> slowRobot = robot ("slowpoke", 20, 30)
-- *Main> robots = [fastRobot, slowRobot]
-- *Main> map getHP robots
-- [40,30]
