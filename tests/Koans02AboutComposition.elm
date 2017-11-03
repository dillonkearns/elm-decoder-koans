module Koans02AboutComposition exposing (suite)

{-
   Hint: you may need some parentheses when you replace the blankDecoder in these
   examples. You'll need to pass in an argument to each of the composite decoders.
   See:
    http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#data-structures
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, testDecodesTo)
import Json.Decode as Decode
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Composition"
        [ testDecodesTo "Decode.list takes one of the primitive decoders as an argument and applies it to each element"
            (Decode.list blankDecoder)
            """[123, 456]"""
            [ 123, 456 ]
        , testDecodesTo "An empty list could be a list of anything so any primitive will do"
            (blankCompositeDecoder Decode.string)
            "[]"
            []
        , testDecodesTo "Decode.nullabe takes one of the primitive decoders and turns it into a Maybe"
            (blankCompositeDecoder Decode.int)
            "12345"
            (Just 12345)
        , testDecodesTo "Decode.nullabe will decode null into Nothing"
            (blankCompositeDecoder Decode.int)
            "null"
            Nothing
        ]
