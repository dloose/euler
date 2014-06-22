-- what is the largest prime factory of the number 600851475143?

-- not great prime factorization but it will do for the numbers we're talking about
factorize :: Int -> [Int] 
factorize n = 1 : factorize' n 2

factorize' :: Int -> Int -> [Int]
factorize' n k 
        | n == k         = [k]
        | n `mod` k == 0 = k : factorize' (n `div` k) k
        | otherwise      = factorize' n (k+1)

largestFactor :: Int -> Int
largestFactor = maximum . factorize

answer3 = largestFactor 600851475143
