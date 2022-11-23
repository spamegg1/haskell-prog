type Pizza = (Double, Double)

areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2)^2

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 = if costP1 < costP2 then p1 else p2 where
    costP1 = costPerInch p1
    costP2 = costPerInch p2

describePizza :: Pizza -> String
describePizza (size, cost) = concat [
    "The ", show size, " pizza is cheaper at ",
    show costSqInch, " per square inch "]
    where costSqInch = costPerInch (size, cost)
