-- What’s the final value of the x variable in the following code?
-- GHCi> let simple y = y
-- GHCi> let x = simple simple
-- GHCi> let x = 6

-- Answer: 6.
-- Because you can reassign values, the final value of x is 6.
