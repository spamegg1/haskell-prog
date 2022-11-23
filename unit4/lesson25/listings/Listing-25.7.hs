{-# LANGUAGE OverloadedStrings #-}
import System.Environment                                             -- getArgs
import System.Random                                                -- randomRIO
import qualified Data.ByteString.Char8 as BC

intToChar :: Int -> Char
intToChar int = toEnum $ int `mod` 255

intToBC :: Int -> BC.ByteString
intToBC int = BC.pack [intToChar int]

replaceByte :: Int -> Int -> BC.ByteString -> BC.ByteString
replaceByte loc charVal bytes = mconcat [before, newChar, after] where
    (before, rest) = BC.splitAt loc bytes  -- ([BC.ByteString], [BC.ByteString])
    after = BC.drop 1 rest                                      -- BC.ByteString
    newChar = intToBC charVal                                   -- BC.ByteString

randomReplaceByte :: BC.ByteString -> IO BC.ByteString
randomReplaceByte bytes = do
    location <- randomRIO (1, BC.length bytes)                  -- Int <- IO Int
    charVal <- randomRIO (0, 255)                               -- Int <- IO Int
    return $ replaceByte location charVal bytes              -- IO BC.ByteString


main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    imageFile <- BC.readFile fileName       -- BC.ByteString <- IO BC.ByteString
    glitched <- randomReplaceByte imageFile -- BC.ByteString <- IO BC.ByteString

    let glitchedFileName = mconcat ["glitched_", fileName]             -- String
    BC.writeFile glitchedFileName glitched                              -- IO ()

    print "all done"                                                    -- IO ()

-- ghc Listing-25.7.hs -o glitcher
-- ./glitcher lovecraft.jpg
