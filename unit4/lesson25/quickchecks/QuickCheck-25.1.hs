-- Write a function that takes numbers in ASCII character form and
-- converts them to Ints. For example, make the following an Int:
-- bcInt :: BC.ByteString
-- bcInt = "6"

-- Answer:
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

func :: BC.ByteString -> Int
func = read . BC.unpack

bcInt :: BC.ByteString
bcInt = "6"
