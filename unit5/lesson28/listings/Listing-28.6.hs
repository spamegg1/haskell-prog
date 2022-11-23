import qualified Data.Map as M

type LatLong = (Double, Double)

locationDB :: M.Map String LatLong
locationDB = M.fromList [
    ("Arkham",(42.6054,-70.7829)),
    ("Innsmouth",(42.8250,-70.8150)),
    ("Carcosa",(29.9714,-90.7694)),
    ("New York",(40.7776,-73.9691))]

toRadians :: Double -> Double
toRadians degrees = degrees * pi / 180

latLongToRads :: LatLong -> (Double, Double)
latLongToRads (lat, long) = (toRadians lat, toRadians long)

earthRadius :: Double
earthRadius = 3961.0

haversine :: LatLong -> LatLong -> Double
haversine coords1 coords2 = earthRadius * c where
    (rlat1, rlong1) = latLongToRads coords1
    (rlat2, rlong2) = latLongToRads coords2
    dlat = rlat2 - rlat1
    dlong = rlong2 - rlong1
    a = (sin(dlat/2))^2 + cos rlat1 * cos rlat2 * (sin(dlong/2))^2
    c = 2 * atan2 (sqrt a) (sqrt(1-a))

printDistance :: Maybe Double -> IO ()
printDistance Nothing = putStrLn "Error, invalid city entered"
printDistance (Just distance) = putStrLn $ show distance ++ " miles"

haversineMaybe :: Maybe LatLong -> Maybe LatLong -> Maybe Double
haversineMaybe Nothing _ = Nothing
haversineMaybe _ Nothing = Nothing
haversineMaybe (Just val1) (Just val2) = Just (haversine val1 val2)

main :: IO ()
main = do
    putStrLn "Enter the starting city name: "
    startingInput <- getLine
    let startingCity = M.lookup startingInput locationDB

    putStrLn "Enter the destination city name: "
    destInput <- getLine
    let destCity = M.lookup destInput locationDB
    let distance = haversine <$> startingCity <*> destCity
    printDistance distance

-- *Main> main
-- Enter the starting city name:
-- Carcosa
-- Enter the destination city name:
-- Arkham
-- 1409.119394610168 miles
