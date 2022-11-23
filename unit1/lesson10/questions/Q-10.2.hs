-- Write a threeRoundFight function that takes two robots and has
-- them fight for three rounds, returning the winner.
-- To avoid having so many different variables for robot state,
-- use a series of nested lambda functions so you can just overwrite
-- robotA and robotB .

-- I did this without learning about type classes and the differences
-- between type, data, newtype. The functions here work without Rank2Types,
-- but winner and threeRoundFight are impossible without Rank2Types.
-- This could probably be redone better with knowledge from Unit2 and
-- the rest of the book.

-- Oh yeah, the author's suggestion of nested lambda functions is disgusting,
-- I'm not gonna do that.

{-# LANGUAGE Rank2Types #-}
import Robots

winner :: Robot t -> Robot t -> Robot t
winner robotA robotB =
    if getHP robotB < getHP robotA
    then robotA
    else robotB

threeRoundFight :: Robot t -> Robot t -> Robot t
threeRoundFight robotA robotB = let
    robotBround1 = fight robotA robotB
    robotAround1 = fight robotBround1 robotA
    robotBround2 = fight robotAround1 robotBround1
    robotAround2 = fight robotBround2 robotAround1
    robotBround3 = fight robotAround2 robotBround2
    robotAround3 = fight robotBround3 robotAround2

    in winner robotAround3 robotBround3
