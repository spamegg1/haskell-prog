-- Q28.3
-- Recall the RobotPart type from the preceding lesson:
import qualified Data.Map as M

data RobotPart = RobotPart {
    name :: String,
    description :: String,
    cost :: Double,
    count :: Int
} deriving Show
-- Make a command-line application that has a database of various
-- RobotPart s (at least five), and then lets the user enter in two-part IDs
-- and returns the one with the lowest cost.
-- Handle the case of the user entering an ID that’s not in the parts database.

-- Answer:
leftArm :: RobotPart
leftArm = RobotPart {
    name = "left arm", description = "left arm for face punching!",
    cost = 1000.00, count = 3
}

leftLeg :: RobotPart
leftLeg = RobotPart {
    name = "left leg", description = "left leg for face kicking!",
    cost = 1000.00, count = 3
}

rightLeg :: RobotPart
rightLeg = RobotPart {
    name = "right leg", description = "right leg for kind kicks",
    cost = 1025.00, count = 5
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

partsDB :: M.Map Int RobotPart
partsDB = M.fromList $ zip keys vals where
    keys = [1, 2, 3, 4, 5]
    vals = [leftArm, rightArm, leftLeg, rightLeg, robotHead]


printCost :: Maybe Double -> IO ()
printCost Nothing = putStrLn "missing item"
printCost (Just cost)= print cost

main :: IO ()
main = do
    putStrLn "enter a part number 1"
    partNo1 <- getLine
    putStrLn "enter a part number 2"
    partNo2 <- getLine
    let part1 = M.lookup(read partNo1) partsDB
    let part2 = M.lookup(read partNo2) partsDB
    let cheapest = min <$> (cost <$> part1) <*> (cost <$> part2)
    printCost cheapest
