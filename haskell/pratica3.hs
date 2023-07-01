nums :: [Int] -> [Int] -> Int -> IO()
nums [] _ _ = putStr ("")
nums _ _ 0 = putStrLn ("")
nums (x:xs) h t = do
                putStrLn (show(x) ++ " foi sorteado " ++ show(length (filter (\y -> y==x) h)) ++ " vez(es)")
                nums xs h (t -1)  
                
semRep :: [Int] -> [Int] -> [Int]
semRep [] h = h
semRep (x:xs) h
              | not (x `elem` h) = semRep xs (h ++ [x])
              | otherwise = semRep xs h

main :: IO()
main = do 
    entrada <- readLn :: IO [Int] 
    novaLista <- return (semRep entrada [])
    if (novaLista == []) then putStrLn ("nenhum numero foi sorteado")
    else nums novaLista entrada (length novaLista)
    