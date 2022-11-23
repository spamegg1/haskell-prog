x = 2
x = 3

-- ➜ ghc Listing-2.4.hs
-- [1 of 1] Compiling Main             ( Listing-2.4.hs, Listing-2.4.o )

-- Listing-2.4.hs:2:1: error:
--     Multiple declarations of ‘x’
--     Declared at: Listing-2.4.hs:1:1
--                  Listing-2.4.hs:2:1
--   |
-- 2 | x = 3
--   | ^
