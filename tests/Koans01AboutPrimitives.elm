module Koans01AboutPrimitives exposing (suite)

{-
   The goal is to make all the tests pass one at a time
   by replacing each `blankDecoder` by building up a decoder from the Json.Decode
   package. See:
   http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#primitives
-}

import Helpers exposing (blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Primitives"
        [ test "You can parse primitive json types with primitive decoders like Decode.int" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo Decode.int "123"
        , test "You can also parse Bools with Decode.bool" <|
            \_ ->
                True
                    |> expectDecodesTo blankDecoder "true"
        , test "Or Floats with Decode.float" <|
            \_ ->
                123.456
                    |> expectDecodesTo blankDecoder "123.456"
        , test "Strings are valid JSON and parse with Decode.string" <|
            \_ ->
                "Hello"
                    |> expectDecodesTo blankDecoder "\"Hello\""
        ]
