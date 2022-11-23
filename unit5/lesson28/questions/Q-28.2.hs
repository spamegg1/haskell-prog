-- Q28.2 Rewrite haversineIO , this time using <*> .

-- Answer:
import qualified Data.Map as M

type LatLong = (Double, Double)

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

haversineIO :: IO LatLong -> IO LatLong -> IO Double
haversineIO x y = haversine <$> x <*> y
