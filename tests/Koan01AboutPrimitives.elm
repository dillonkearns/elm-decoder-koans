module Koan01AboutPrimitives exposing (suite)

{-
   The goal is to make all the tests pass one at a time
   by replacing each `blankDecoder` by building up a decoder from the Json.Decode
   package: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode
-}

import Helpers exposing (blankDecoder, testDecodesTo)
import Json.Decode as Decode
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Primitives"
        [ testDecodesTo
            "You can parse primitive json types with primitive decoders like Decode.int"
            blankDecoder
            "123"
            123
        , testDecodesTo
            "You can also parse Bools with Decode.bool"
            blankDecoder
            "true"
            True
        , testDecodesTo
            "Or Floats with Decode.float"
            blankDecoder
            "123.456"
            123.456
        , testDecodesTo
            "Strings are valid JSON and parse with Decode.string"
            blankDecoder
            "\"Hello\""
            "Hello"
        ]
