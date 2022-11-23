{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

someText :: T.Text
someText = "Some\ntext for\tyou"

-- GHCi> :t T.words
-- T.lines :: T.Text -> [T.Text]
-- GHCi> T.words someText
-- ["Some", "text", "for", "you"]

-- GHCi> :t T.unwords
-- T.unwords :: [T.Text] -> T.Text
-- GHCi> T.unwords (T.words someText)
-- "Some text for you"
