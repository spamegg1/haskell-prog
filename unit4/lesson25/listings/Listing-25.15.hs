{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString as B
import Data.Text as T

nagarjunaText :: T.Text
nagarjunaText = " नागर्जुनॅ "

nagarjunaB :: B.ByteString
nagarjunaB = (BC.pack . T.unpack) nagarjunaText

-- *Main> nagarjunaText
-- " \2344\2366\2327\2352\2381\2332\2369\2344\2373 "
-- *Main> nagarjunaB
-- " (>\ETB0M\FSA(E "
