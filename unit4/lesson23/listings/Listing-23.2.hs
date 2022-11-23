import qualified Data.Text as T

myWord :: T.Text
myWord = "dog"

-- *Main> :l Listing-23.2
-- [1 of 1] Compiling Main             ( Listing-23.2.hs, interpreted )

-- Listing-23.2.hs:4:10: error:
--     • Couldn't match expected type ‘T.Text’ with actual type ‘[Char]’
--     • In the expression: "dog"
--       In an equation for ‘myWord’: myWord = "dog"
--   |
-- 4 | myWord = "dog"
--   |          ^^^^^
-- Failed, no modules loaded.
