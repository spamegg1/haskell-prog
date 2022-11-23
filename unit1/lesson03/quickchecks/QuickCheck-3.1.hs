-- Write a lambda function that doubles its argument,
-- and pass in a few numbers as arguments.

--  ➜ ghci
-- GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
-- Prelude> (\x -> x*2) 5
-- 10
-- Prelude> (\x -> x*2) 'a'

-- <interactive>:2:8: error:
--     • No instance for (Num Char) arising from a use of ‘*’
--     • In the expression: x * 2
--       In the expression: \ x -> x * 2
--       In the expression: (\ x -> x * 2) 'a'
-- Prelude>
