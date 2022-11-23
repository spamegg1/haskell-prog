-- Write a list comprehension that takes the following words
-- and capitalizes the first letter, and prepends Mr. in front.
-- (Hint: use Data.Char’s toUpper.)

-- Answer:
import Data.Char
strings = ["brown","blue","pink","orange"]

capitalize :: String -> String
capitalize string = do
    index <- [0 .. length string - 1]
    let char = string !! index
    return (if index == 0 then toUpper char else char)

prefix :: [String]
prefix = do
    string <- strings
    return $ "Mr. " ++ capitalize string

-- Here is the single list comprehension solution:
answer :: [String]
answer = ["Mr. " ++ capped |
    val <- strings, let capped = (\(x:xs) -> toUpper x : xs) val]
