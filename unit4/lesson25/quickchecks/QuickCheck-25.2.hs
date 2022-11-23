-- At this point, the glitched variable in your main doesn’t need to be an IO
-- type. Change that line so that glitched is a regular variable.

-- Answer:
{-# LANGUAGE OverloadedStrings #-}
import System.Environment                                             -- getArgs
import qualified Data.ByteString.Char8 as BC

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    imageFile <- BC.readFile fileName       -- BC.ByteString <- IO BC.ByteString
    let glitched = imageFile                                    -- BC.ByteString

    let glitchedFileName = mconcat ["glitched_", fileName]             -- String
    BC.writeFile glitchedFileName glitched                              -- IO ()

    print "all done"                                                    -- IO ()
