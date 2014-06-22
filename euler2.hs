-- By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms

fibonacci = 0 : 1 : zipWith (+) fibonacci (tail fibonacci)
answer2 = sum [x | x <- takeWhile (< 4000000) fibonacci]
