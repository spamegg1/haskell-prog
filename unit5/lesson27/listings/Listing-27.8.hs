import qualified Data.Map as M

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

renderHtml :: RobotPart -> Html
renderHtml part = mconcat ["<h2>", name part, "</h2>", "<p><h3>desc</h3>",
    description part, "</p><p><h3>cost</h3>", show $ cost part,
    "</p><p><h3>count</h3>", show $ count part, "</p>"]

partsDB :: M.Map Int RobotPart
partsDB = M.fromList $ zip keys vals where
    keys = [1, 2, 3]
    vals = [leftArm, rightArm, robotHead]
