module Koans03AboutMapping exposing (suite)

{-
   Hint: you may need some parentheses when you replace the blankDecoder in these
   examples. You'll need to pass in an argument to each of the composite decoders.
   See:
    http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#mapping
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode exposing (Decoder)
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Mapping"
        [ test "Decode.map performs a transformation" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo (Decode.string |> Decode.map String.toUpper)
                        "\"Hello\""
        , test "you can pass in an anonymous function" <|
            \_ ->
                let
                    fn =
                        \n -> x____replace me____x
                in
                1234
                    |> expectDecodesTo (Decode.int |> Decode.map fn)
                        "1000"
        , test "mapping allows you to make any transformation to the value" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.string
                            |> Decode.map (\greeting -> greeting ++ " World!")
                        )
                        "\"Bonjour\""
        , test "you can perform two transformations" <|
            \_ ->
                "Goodbye"
                    |> expectDecodesTo
                        (Decode.string
                            |> Decode.map String.toUpper
                            |> blankCompositeDecoder
                        )
                        "\"goodbye\""
        , test "Decode.map can transform the type of the decoder it is mapping on" <|
            \_ ->
                let
                    stringDecoder : Decoder String
                    stringDecoder =
                        Decode.string

                    transformedStringDecoder : Decoder Int
                    transformedStringDecoder =
                        stringDecoder
                            |> Decode.map String.length
                in
                x____replace me____x
                    |> expectDecodesTo transformedStringDecoder "\"goodbye\""
        ]
