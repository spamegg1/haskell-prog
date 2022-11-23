-- Q23.2
-- Use Data.Text.Lazy and Data.Text.Lazy.IO to
-- rewrite the lazy I/O section from lesson 22 by using the Text type.

-- toInts :: String -> [Int]
-- toInts = map read . lines

-- main :: IO ()
-- main = do
--     userInput <- getContents
--     let numbers = toInts userInput
--     print (sum numbers)

-- Answer:
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as TIO

-- T.unpack :: Text -> String
-- read :: String -> Int
toInts :: T.Text -> [Int]
toInts = map (read . T.unpack) . T.lines

main :: IO ()
main = do
    userInput <- TIO.getContents
    let numbers = toInts userInput
    -- show :: Int -> String, T.pack :: String -> Text
    TIO.putStrLn $ T.pack . show $ sum numbers

-- ghc Q-23.2.hs -o sum_lazy
-- [1 of 1] Compiling Main             ( Q-23.2.hs, Q-23.2.o )
-- Linking sum_lazy ...

-- ./sum_lazy
-- 1
-- 2
-- 3
-- 4
-- 10
