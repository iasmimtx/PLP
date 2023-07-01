menu :: String -> Int
menu order 
        | order == "cafe" = 4
        | order == "pao" = 2
        | order == "suco" = 5
        | order == "pao de queijo" = 5
        | order == "sanduiche" = 3
        | otherwise = 0 -- caso o usuario digite outra coisa fora do cardapio
        

main :: IO()
main = do
    input <- readLn
    total <- calculaValorPedido input 0
    print total

calculaValorPedido :: Int -> Int -> IO Int
calculaValorPedido 0 valor = return valor --caso base: quando nao tiver mais itens para inserir, retorna o valor acumulado
calculaValorPedido input valor = do
    prox <- getLine
    let val = menu prox
    calculaValorPedido (input-1) (valor + val) -- passo recursivo com um item a menos e valor acumulado atualizado