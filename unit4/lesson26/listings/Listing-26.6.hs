{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Encoding as E
import Data.Maybe

type Author = T.Text
type Title = T.Text
type Html = T.Text

data Book = Book { author :: Author, title :: Title } deriving Show

bookToHtml :: Book -> Html
bookToHtml book = mconcat ["<p>\n", titleInTags, authorInTags, "</p>\n"] where
    titleInTags = mconcat ["<strong>", title book, "</strong>\n"]
    authorInTags = mconcat ["<em>", author book, "</em>"]

book1 :: Book
book1 = Book { title = "The Conspiracy Against the Human Race",
                author = "Ligotti, Thomas" }

book2 :: Book
book2 = Book { title = "A Short History of Decay", author = "Cioran, Emil" }

book3 :: Book
book3 = Book { title = "The Tears of Eros", author = "Bataille, Georges" }

-- GHCi> bookToHtml book1
-- "<p>\n<strong>The Conspiracy Against the Human Race</strong>\n<em>Ligotti,
-- ➥ Thomas</em>\n</p>\n"
