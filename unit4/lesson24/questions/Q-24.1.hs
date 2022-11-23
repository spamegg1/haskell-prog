-- Q24.1
-- Write a version of the Unix cp program that will copy a file and allow you to
-- rename it (just mimic the basic functionality and don’t worry
-- about specific flags).

-- Answer:
import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let source = args !! 0                                             -- String
    let dest = args !! 1                                               -- String

    input <- TIO.readFile source                          -- T.Text <- IO T.Text
    TIO.writeFile dest input                                            -- IO ()
