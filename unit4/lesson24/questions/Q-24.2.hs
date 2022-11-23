-- Q24.2
-- Write a program called capitalize.hs that will take a file as an argument,
-- read that file, and then rewrite it capitalized.

-- Answer:
import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    input <- TIO.readFile fileName                        -- T.Text <- IO T.Text
    TIO.writeFile fileName (T.toUpper input)                            -- IO ()
