import qualified Data.Map as M

type LatLong = (Double, Double)

locationDB :: M.Map String LatLong
locationDB = M.fromList [
    ("Arkham",(42.6054,-70.7829)),
    ("Innsmouth",(42.8250,-70.8150)),
    ("Carcosa",(29.9714,-90.7694)),
    ("New York",(40.7776,-73.9691))]
