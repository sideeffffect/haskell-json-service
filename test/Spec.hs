import Test.Hspec
import Test.QuickCheck
import Generic.Random

import Lib hiding (main)

instance Arbitrary Sum where
  arbitrary = genericArbitraryU
  shrink = genericShrink

main :: IO ()
main = hspec $
  describe "peformSum" $ do
    it "1 + 2 = 3" $
      performSum Sum { getX = 1, getY = 2} `shouldBe` Result 3

    it "sums x and y" $
      property $ \s -> performSum s == Result (getX s + getY s)
