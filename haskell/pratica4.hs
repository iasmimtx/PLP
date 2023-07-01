remove :: String -> String
remove t = unwords $ filter (\w -> length w > 3) (words t) -- recebe uma lista de palavras e junta em uma unica string separando por espaços.

main :: IO()
main = do
    texto <- getLine
    putStrLn (remove texto)