-- What would happen if you tried to add ("Paper",12.4) to your inventory?
itemCount1 :: (String,Int)
itemCount1 = ("Erasers",25)

itemCount2 :: (String,Int)
itemCount2 = ("Pencils",25)

itemCount3 :: (String,Int)
itemCount3 = ("Pens",13)

itemInventory :: [(String,Int)]
itemInventory = [itemCount1,itemCount2,itemCount3]

-- Answer:
-- It would cause an error because the rest of your pairs are (String,Int), and
-- ("Paper",12.4) would be a (String,Double).
