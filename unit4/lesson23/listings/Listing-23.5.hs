{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

sampleInput :: T.Text
sampleInput = "this\nis\ninput"

-- GHCi> :t T.lines
-- T.lines :: T.Text -> [T.Text]
-- GHCi> T.lines sampleInput
-- ["this", "is", "input"]

-- GHCi> :t T.unlines
-- T.unlines :: [T.Text] -> T.Text
-- GHCi> T.unlines (T.lines sampleInput)
-- "this\nis\ninput\n"
