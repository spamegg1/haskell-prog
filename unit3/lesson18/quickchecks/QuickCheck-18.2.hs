-- What’s the difference between transform and the map function for lists?
-- (Hint: Look up the type signature of map again.)

-- Answer:
-- The transform function doesn’t allow you to change the type;
-- that is, a function (a -> b). The map function for lists does allow this.
-- map :: (a -> b) -> [a] -> [b]
-- transform :: (a -> a) -> Triple a -> Triple a
