{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Encoding as E
import Data.Maybe

type Author = T.Text
type Title = T.Text
type Html = T.Text
type FieldText = T.Text
type MarcRecordRaw = B.ByteString
type MarcLeaderRaw = B.ByteString
type MarcDirectoryRaw = B.ByteString
type MarcDirectoryEntryRaw = B.ByteString

data Book = Book { author :: Author, title :: Title } deriving Show
data FieldMetadata = FieldMetadata {
    tag :: T.Text, fieldLength :: Int, fieldStart :: Int} deriving Show

bookToHtml :: Book -> Html
bookToHtml book = mconcat ["<p>\n", titleInTags, authorInTags, "</p>\n"] where
    titleInTags = mconcat ["<strong>", title book, "</strong>\n"]
    authorInTags = mconcat ["<em>", author book, "</em>"]

booksToHtml :: [Book] -> Html
booksToHtml books = mconcat ["<html>\n", "<head><title>books</title>",
    "<meta charset='utf-8'/>", "</head>\n", "<body>\n", booksHtml,
    "\n</body>\n", "</html>"]
    where booksHtml = mconcat . (map bookToHtml) $ books

book1 :: Book
book1 = Book { title = "The Conspiracy Against the Human Race",
                author = "Ligotti, Thomas" }

book2 :: Book
book2 = Book { title = "A Short History of Decay", author = "Cioran, Emil" }

book3 :: Book
book3 = Book { title = "The Tears of Eros", author = "Bataille, Georges" }

myBooks :: [Book]
myBooks = [book1,book2,book3]

leaderLength :: Int
leaderLength = 24

getLeader :: MarcLeaderRaw -> MarcRecordRaw
getLeader = B.take leaderLength

rawToInt :: B.ByteString -> Int
rawToInt = read . T.unpack . E.decodeUtf8

getRecordLength :: MarcLeaderRaw -> Int
getRecordLength = rawToInt . (B.take 5)

nextAndRest :: B.ByteString -> (MarcRecordRaw, B.ByteString)
nextAndRest marcStream = B.splitAt (getRecordLength marcStream) marcStream

allRecords :: B.ByteString -> [MarcRecordRaw]
allRecords marcStream =
    if marcStream == B.empty
    then []
    else next : allRecords rest
    where (next, rest) = nextAndRest marcStream

getBaseAddress :: MarcLeaderRaw -> Int
getBaseAddress leader = rawToInt $ B.take 5 $ B.drop 12 leader

getDirectoryLength :: MarcLeaderRaw -> Int
getDirectoryLength leader = getBaseAddress leader - leaderLength - 1

getDirectory :: MarcRecordRaw -> MarcDirectoryRaw
getDirectory record = B.take directoryLength afterLeader where
    directoryLength = getDirectoryLength record
    afterLeader = B.drop leaderLength record

dirEntryLength :: Int
dirEntryLength = 12

splitDirectory :: MarcDirectoryRaw -> [MarcDirectoryEntryRaw]
splitDirectory directory =
    if directory == B.empty
    then []
    else nextEntry : splitDirectory restEntries
    where (nextEntry, restEntries) = B.splitAt dirEntryLength directory

makeFieldMetadata :: MarcDirectoryEntryRaw -> FieldMetadata
makeFieldMetadata entry = FieldMetadata textTag theLength theStart where
    (theTag, rest) = B.splitAt 3 entry
    textTag = E.decodeUtf8 theTag
    (rawLength, rawStart) = B.splitAt 4 rest
    theLength = rawToInt rawLength
    theStart = rawToInt rawStart

getFieldMetadata :: [MarcDirectoryEntryRaw] -> [FieldMetadata]
getFieldMetadata = map makeFieldMetadata


main :: IO ()
main = do
    marcData <- B.readFile "sample.mrc"
    let marcRecords = allRecords marcData
    print $ length marcRecords
