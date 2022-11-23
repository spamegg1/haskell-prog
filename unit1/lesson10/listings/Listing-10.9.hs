type Robot t = ((String, Int, Int) -> t) -> t

robot :: (String, Int, Int) -> Robot t
robot (name, attack, hp) = \message -> message (name, attack, hp)

name :: (String, Int, Int) -> String
name (n, _, _) = n

attack :: (String, Int, Int) -> Int
attack (_, a, _) = a

hp :: (String, Int, Int) -> Int
hp (_, _, h) = h
