-- find the largest palindrome made from the product of two 3-digit numbers

-- How do you determine if a number is palindromeic? You can cheat and convert the number to a string then test the string. It's just as easy to decompose the number into digits then test the list. The palindrome function is the same for ints and chars. You have to write the converion function but that's just a matter of dividing by 10 a bunch of times.

-- toDigits' produces the digits in reverse order which is good enough for the problem, but feels kind of gross to me
toDigits :: Int -> [Int]
toDigits = reverse . toDigits'

-- produces the digits in reverse order, which is actually ok for this problem
toDigits' :: Int -> [Int]
toDigits' 0 = []
toDigits' n = n `mod` 10 : toDigits' (n `div` 10)

-- ok, now we need to know if it's a palindrome so we need a function
palindrome :: Eq a => [a] -> Bool

-- look, there are a couple of ways to do this. there's an easy one like
-- palindrome? xs = xs == (reverse xs)
-- but that feels like cheating. I'd rather define it recursively

-- the base cases are easy enough
--palindrome []     = True
--palindrome (x:[]) = True
--palindrome (x:xs) = (x == last xs) && (palindrome $ init xs)

-- turns out this is a smidge faster than my impl
palindrome xs = xs == (reverse xs)

-- define the predicate for convenience
palindromeNum :: Int -> Bool
palindromeNum = palindrome . toDigits

-- ok, now the solution I guess
-- compute all possible multiples
multiples :: [Int]
multiples = [x * y | x <- [100..999], y <- [x..999]]

-- now select the palindromes
palindromes :: [Int]
palindromes = [x | x <- multiples, palindromeNum x]

-- finally we take the maximum
-- this takes a long time to compute. Is there a better way?
answer4 = maximum palindromes
