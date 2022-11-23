-- The problem with the one-time pad is the one-time pad itself.
-- It has to be at least as long as the message you want to send,
-- and you can use it only one time. The solution is to
-- generate your own one-time pad from a “seed.” How is this done?
-- All you need is a pseudo-random number generator (PRNG).
-- Given an initial seed value, a PRNG produces a random number.
-- Then this next number can be used as the seed for the next number.
-- By generating a stream of Int s, you can use intToBits to create
-- all the necessary xor values you need. In this way, a PRNG can use a
-- single number to transmit an effectively infinitely long one-time pad.
-- Encrypting a message by using the output of a PRNG as the pad is
-- called a stream cipher.

-- To explore this on your own, use the PRNG to create a
-- StreamCipher type that can be an instance of the Cipher class.

prng :: Int -> Int -> Int -> Int -> Int
prng a b maxNumber seed = (a*seed + b) `mod` maxNumber

examplePRNG :: Int -> Int
examplePRNG = prng 1337 7 100

class Cipher a where
    encode :: a -> String -> String
    decode :: a -> String -> String

-- Answer: TODO

data StreamCipher = StreamCipher ???

instance Cipher StreamCipher where
    encode StreamCipher ??? = ???
    decode StreamCipher ??? = ???
