data ResourceConstrained a = NoResources | Okay a

x = pure (+) <*> [1000,2000,3000] <*> [500,20000]
-- [1500,21000,2500,22000,3500,23000]
