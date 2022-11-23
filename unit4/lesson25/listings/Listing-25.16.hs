{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString as B
import qualified Data.Text.Encoding as E
import qualified Data.Text.IO as TIO
import qualified Data.Text as T

nagarjunaText :: T.Text
nagarjunaText = " नागर्जुनॅ "

nagarjunaB :: B.ByteString
nagarjunaB = (BC.pack . T.unpack) nagarjunaText

-- *Main> nagarjunaText
-- " \2344\2366\2327\2352\2381\2332\2369\2344\2373 "
-- *Main> nagarjunaB
-- " (>\ETB0M\FSA(E "

-- GHCi> TIO.putStrLn ((T.pack . BC.unpack) nagarjunaB)
-- "(>\ETB0M\FSA("

nagarjunaSafe :: B.ByteString
nagarjunaSafe = E.encodeUtf8 nagarjunaText

-- GHCi> TIO.putStrLn (E.decodeUtf8 nagarjunaSafe)
-- नागर्जुन
