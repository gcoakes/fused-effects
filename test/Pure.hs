{-# OPTIONS_GHC -Wno-orphans #-}
module Pure
( module Control.Carrier.Pure
, gen
) where

import Control.Carrier.Pure
import Hedgehog
import Test.Tasty.QuickCheck hiding (Gen)

instance Arbitrary1 PureC where
  liftArbitrary genA = PureC <$> genA
  liftShrink shrinkA = map PureC . shrinkA . run

instance Arbitrary a => Arbitrary (PureC a) where
  arbitrary = arbitrary1
  shrink = shrink1


gen :: Gen a -> Gen (PureC a)
gen = fmap PureC
