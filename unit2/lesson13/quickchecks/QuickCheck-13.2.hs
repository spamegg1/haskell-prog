-- Why isn’t division included in the list of functions needed for a Num?

-- Answer: Int and Integer would not have a division operation defined.
-- Division of two integers like 5/2 would have to return a Double 2.5.
-- The type class for types that have a well-defined division is Fractional.
