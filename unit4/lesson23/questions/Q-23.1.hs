-- Q23.1
-- Rewrite the hello_world.hs program (reproduced here) from lesson 21 to use
-- Text instead of String types.

-- helloPerson :: String -> String
-- helloPerson name = "Hello" ++ " " ++ name ++ "!"

-- main :: IO ()
-- main = do
--     putStrLn "Hello! What's your name?"
--     name <- getLine
--     let statement = helloPerson name
--     putStrLn statement

-- Answer:
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

helloPerson :: T.Text -> T.Text
helloPerson name = "Hello" <> " " <> name <> "!"

main :: IO ()
main = do
    TIO.putStrLn "Hello! What's your name?"
    name <- TIO.getLine
    let statement = helloPerson name
    TIO.putStrLn statement
