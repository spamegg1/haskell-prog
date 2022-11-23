{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

sampleBytes :: B.ByteString
sampleBytes = "Hello!"

-- WITHOUT Char8:
-- B.unpack :: B.ByteString -> [GHC.Word.Word8]
-- sampleString :: String
-- sampleString = B.unpack sampleBytes

-- WITH Char8:
-- B.unpack :: BC.ByteString -> [GHC.Word.Word8]
-- BC.unpack :: BC.ByteString -> [Char]
sampleString :: String
sampleString = BC.unpack sampleBytes
