{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import Data.Semigroup

breakText :: T.Text
breakText = "simple"

exampleText :: T.Text
exampleText = "This is simple to do"

-- GHCi> :t T.splitOn
-- T.lines :: T.Text -> T.Text -> [T.Text]
-- GHCi> T.splitOn breakText exampleText
-- ["This is ", " to do"]

-- GHCi> :t T.intercalate
-- T.intercalate :: T.Text -> [T.Text] -> T.Text
-- GHCi> T.intercalate breakText (T.splitOn breakText exampleText)
-- "This is simple to do"


combinedTextMonoid :: T.Text
combinedTextMonoid = mconcat ["some"," ","text"]        -- concat does NOT work!

combinedTextSemigroup :: T.Text
combinedTextSemigroup = "some" <> " " <> "text"
