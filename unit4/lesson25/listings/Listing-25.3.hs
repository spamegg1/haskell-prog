{-# LANGUAGE OverloadedStrings #-}
import System.Environment
import qualified Data.ByteString.Char8 as BC

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    imageFile <- BC.readFile fileName       -- BC.ByteString <- IO BC.ByteString
    glitched <- return imageFile            -- BC.ByteString <- IO BC.ByteString

    let glitchedFileName = mconcat ["glitched_", fileName]             -- String
    BC.writeFile glitchedFileName glitched                              -- IO ()

    print "all done"                                                    -- IO ()
