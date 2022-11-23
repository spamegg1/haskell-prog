-- Q27.3
-- Write a command-line interface for partsDB that lets
-- the user look up the cost of an item, given an ID.
-- Use the Maybe type to handle the case of the user entering missing input.

-- Answer:
import qualified Data.Map as M
import System.Environment                                  -- needed for getArgs

data RobotPart = RobotPart {
    name :: String, description :: String, cost :: Double, count :: Int
} deriving Show

type Html = String

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

partsDB :: M.Map Int RobotPart
partsDB = M.fromList $ zip keys vals where
    keys = [1, 2, 3]
    vals = [leftArm, rightArm, robotHead]

main :: IO ()
main = do
    id <- getLine                                         -- String <- IO String
    let part = M.lookup (read id) partsDB                     -- Maybe RobotPart
    print $ cost <$> part                                                  -- IO
