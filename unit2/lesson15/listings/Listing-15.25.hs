class Cipher a where
    encode :: a -> String -> String
    decode :: a -> String -> String
