data RobotPart = RobotPart {
    name :: String, description :: String, cost :: Double, count :: Int
} deriving Show

leftArm :: RobotPart
leftArm = RobotPart {
    name = "left arm", description = "left arm for face punching!",
    cost = 1000.00, count = 3
}

rightArm :: RobotPart
rightArm = RobotPart {
    name = "right arm", description = "right arm for kind hand gestures",
    cost = 1025.00, count = 5
}

robotHead :: RobotPart
robotHead = RobotPart {
    name = "robot head", description = "this head looks mad",
    cost = 5092.25, count = 2
}
