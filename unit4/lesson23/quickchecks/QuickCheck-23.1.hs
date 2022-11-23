-- Create fourthWord once again, making the String type T.Text.

-- Answer:
import qualified Data.Text as T

firstWord :: String
firstWord = "pessimism"

secondWord :: T.Text
secondWord = T.pack firstWord

thirdWord :: String
thirdWord = T.unpack secondWord

fourthWord :: T.Text
fourthWord = T.pack thirdWord
