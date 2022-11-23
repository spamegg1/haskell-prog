-- For the myGCD function, does it matter if a > b or a < b?

-- Answer: NO.
-- It doesn’t matter, and adds only one extra step, if a < b.
-- For example, 20 `mod` 50 is 20, so the next call would be myGCD 50 20,
-- which is just one more step than calling myGCD 50 20 to begin with.
