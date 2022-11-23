-- Q21.1
-- Translate listing 21.1 (reproduced below) into code
-- by using do-notation in a Maybe .
-- Assume that all the user input is replaced
-- with a Map with a value for the input.
-- Ignore the first putStrLn and simply return the statement at the end.

-- helloPerson :: String -> String
-- helloPerson name = "Hello" ++ " " ++ name ++ "!"

-- main :: IO ()
-- main = do
--     putStrLn "Hello! What's your name?"
--     name <- getLine
--     let statement = helloPerson name
--     putStrLn statement

-- Answer:
import qualified Data.Map as Map

helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

inputMap :: Map.Map Int String
inputMap = Map.fromList [(1, "Spam")]

hello :: Maybe String
hello = do
    name <- Map.lookup 1 inputMap
    let statement = helloPerson name
    return statement
