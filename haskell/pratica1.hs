import Text.Printf (printf)


calculateTax :: Float -> Float 
calculateTax wage
            | wage < 1903.98 = 0.00
            | wage >= 1903.99 && wage <= 2826.65 = 142.80 + 0.075 * (wage - 1903.99)
            | wage >= 2826.66 && wage <= 3751.05 = 354.80 + 0.15 * (wage - 2826.66)
            | wage >= 3751.06 && wage <= 4664.68 = 636.13 + 0.225 * (wage - 3751.06)
            | otherwise = 869.36 + 0.275 * (wage - 4664.68)

main :: IO()
main = do
    input <- readLn :: IO Float
    let value = calculateTax input
    printf "O valor do imposto de renda retido eh: R$ %.2f\n" value
    printf "O salario liquido eh: R$ %.2f\n" (input - value)