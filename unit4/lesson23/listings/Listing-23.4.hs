-- when compiling on command line: ghc text.hs -XOverloadedStrings
-- or, use the PRAGMA:
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

aWord :: T.Text
aWord = "Cheese"

main :: IO ()
main = do
    print aWord

-- OTHER LANGUAGE EXTENSIONS:
-- ViewPatters
-- TemplateHaskell
-- DuplicateRecordFields
-- NoImplicitPrelude
