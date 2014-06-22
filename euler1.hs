-- Find the sum of all of the multiples of 3 and 5 below 1000
answer1 = sum [x | x <- [1..1000], x `mod` 3 == 0 || x `mod` 5 == 0]
