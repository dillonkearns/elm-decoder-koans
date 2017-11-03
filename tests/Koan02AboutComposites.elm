module Koan02AboutComposites exposing (suite)

{-
   Hint: you may need some parentheses when you replace the blankDecoder in these
   examples. You'll need to pass in an argument to each of the composite decoders.
   See:
    http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#data-structures
-}

import Helpers exposing (blankDecoder, testDecodesTo)
import Json.Decode as Decode
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Composites"
        [ testDecodesTo "Decode.list takes one of the primitive decoders as an argument and applies it to each element"
            blankDecoder
            """["abc", "xyz"]"""
            [ "abc", "xyz" ]
        , testDecodesTo "An empty list could be a list of anything so any primitive will do"
            blankDecoder
            "[]"
            []
        , testDecodesTo "Decode.nullabe takes one of the primitive decoders and turns it into a Maybe"
            blankDecoder
            "12345"
            (Just 12345)
        , testDecodesTo "Decode.nullabe will decode null into Nothing"
            blankDecoder
            "null"
            Nothing
        ]
