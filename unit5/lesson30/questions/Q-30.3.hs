-- Q 30.3
-- Implement a bind function which is the same as (>>=) for Maybe :
bind :: Maybe a -> (a -> Maybe b) -> Maybe b
bind Nothing _ = Nothing
bind (Just x) f = f x

test1 = bind Nothing (Just . (+ 2)) -- Nothing
test2 = bind (Just 2) (Just . (+ 2)) -- Just 4
