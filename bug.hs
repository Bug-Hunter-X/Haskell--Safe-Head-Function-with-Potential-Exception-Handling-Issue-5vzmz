```haskell
import Data.Maybe (fromMaybe)

-- This function attempts to safely extract the head of a list
-- and applies a function to it, returning Nothing if the list is empty.
safeHead :: (a -> b) -> [a] -> Maybe b
safeHead f xs = case xs of
  [] -> Nothing
  x: _ -> Just (f x)

-- This function calculates the factorial of a non-negative integer.
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- This function tries to calculate the factorial of the head of a list, 
-- handling potential errors gracefully.
main :: IO ()
main = do
  let list1 = [5, 4, 3, 2, 1]
  let list2 = []
  let result1 = safeHead factorial list1
  let result2 = safeHead factorial list2
  print (fromMaybe 0 result1)  --Prints 120
  print (fromMaybe 0 result2)  --Prints 0
```