```haskell
import Data.Maybe (fromMaybe)

-- Improved safeHead function with exception handling
safeHead :: (a -> Maybe b) -> [a] -> Maybe b
safeHead f xs = case xs of
  [] -> Nothing
  x: _ -> f x

-- Modified factorial function to return Maybe Integer
factorial :: Integer -> Maybe Integer
factorial n
  | n < 0 = Nothing
  | n == 0 = Just 1
  | otherwise = fmap (*n) (factorial (n - 1))

main :: IO ()
main = do
  let list1 = [5, 4, 3, 2, 1]
  let list2 = []
  let list3 = [-1,2,3] -- added for testing
  let result1 = safeHead factorial list1
  let result2 = safeHead factorial list2
  let result3 = safeHead factorial list3
  print (fromMaybe 0 result1) --Prints 120
  print (fromMaybe 0 result2) --Prints 0
  print (fromMaybe 0 result3) --Prints 0
```