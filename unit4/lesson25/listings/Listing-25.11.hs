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

sortSection :: Int -> Int -> BC.ByteString -> BC.ByteString
sortSection start size bytes = mconcat [before, changed, after] where
    (before, rest) = BC.splitAt start bytes-- ([BC.ByteString], [BC.ByteString])
    (target, after) = BC.splitAt size rest -- ([BC.ByteString], [BC.ByteString])
    changed = BC.reverse $ BC.sort target                       -- BC.ByteString

randomSortSection :: BC.ByteString -> IO BC.ByteString
randomSortSection bytes = do
    let sectionSize = 25                                                  -- Int
    let range = BC.length bytes - sectionSize                             -- Int
    start <- randomRIO (0, range)                               -- Int <- IO Int
    return $ sortSection start sectionSize bytes             -- IO BC.ByteString


main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    imageFile <- BC.readFile fileName       -- BC.ByteString <- IO BC.ByteString
    glitched1 <- randomReplaceByte imageFile-- BC.ByteString <- IO BC.ByteString
    glitched2 <- randomSortSection imageFile-- BC.ByteString <- IO BC.ByteString
    glitched3 <- randomReplaceByte imageFile-- BC.ByteString <- IO BC.ByteString
    glitched4 <- randomSortSection imageFile-- BC.ByteString <- IO BC.ByteString
    glitched5 <- randomReplaceByte imageFile-- BC.ByteString <- IO BC.ByteString

    let glitchedFileName = mconcat ["glitched_", fileName]             -- String
    BC.writeFile glitchedFileName glitched5                             -- IO ()

    print "all done"                                                    -- IO ()
