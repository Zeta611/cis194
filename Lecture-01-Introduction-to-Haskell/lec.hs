x :: Int
x = 3
-- comment
{- enclosed comment -}

y :: Int
y = y + 1  -- lazy definition

i :: Int
i = -78

biggestInt, smallestInt :: Int
biggestInt = maxBound
smallestInt = minBound

-- While Int is machine-sized, Integer is arbitrary-precision
n :: Integer
n = 1234123514613687224562572467

reallyBig :: Integer
reallyBig = 2^(2^(2^(2^2)))

numDigits :: Int
numDigits = length (show reallyBig)

d1, d2 :: Double
d1 = 3.1415
d2 = 6.022e23

b1, b2 :: Bool
b1 = True
b2 = False

c1, c2, c3 :: Char
c1 = '안'
c2 = 'µ'
c3 = 'Z'

s :: String
s = "Hello, Haskell!"

ex01 = 3 + 2
ex02 = 19 - 27
ex03 = 2.35 * 8.6
ex04 = 8.7 / 3.1
ex05 = mod 19 3
ex06 = 19 `mod` 3
ex07 = 7 ^ 222
ex08 = (-3) * (-7)

-- Explicitly convert via fromIntegral or round/floor/ceiling
-- use div for integer division
ex09 = i `div` i
ex10 = 12 `div` 5

ex11 = True && False
ex12 = not (False || True)

ex13 = 'a' == 'a'
ex14 = 16 /= 3
ex15 = 5 > 3 && 'p' <= 'q'
ex16 = "Haskell" > "C++"

-- Haskell does have if-expressions, but not idiomatic---pattern matching or guards are used

-- Without explicit type, sumtorial :: (Eq p, Num p) => p -> p
-- I think this inferred the most general where p statisfies typeclasses Eq and Num
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

-- guards
hailstone :: Integer -> Integer
hailstone n
  | n `mod` 2 == 0 = n `div` 2
  | otherwise = 3 * n + 1

foo :: Integer ->  Integer
foo 0 = 16
foo 1
  | "Haskell " > "C++" = 3
  | otherwise = 4
foo n
  | n < 0 = 0
  | n `mod` 17 == 2 = -43
  | otherwise = n + 3

isEven :: Integer -> Bool
isEven n = n `mod` 2 == 0

p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x, y) = x + y
-- Do not use triples, quadruples, etc, although possible

f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex17 = f 3 (i + 1) 8

nums, range, range2 :: [Integer]
nums = [2, 3, 5, 7, 11]
range = [1..100]
range2 = [2, 4..100]

hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']
hello2 :: String
hello2 = "hello"
helloSame = hello1 == hello2

-- cons is :
ex18 = 1 : []
ex19 = 3 : 1 : []
ex20 = 2 : 3 : 4 : []
ex21 = [2, 3, 4] == ex20

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x : xs) = 1 + intListLength xs

-- The following is O(1) due to Haskell's lazy evaluation! <- probably need to use `seq`?
hailStoneLen :: Integer -> Integer
hailStoneLen n = intListLength (hailstoneSeq n) - 1
