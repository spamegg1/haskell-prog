{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Encoding as E
import Data.Maybe

type Author = T.Text
type Title = T.Text
data Book = Book { author :: Author, title :: Title } deriving Show
