module Koans04AboutFields exposing (suite)

{-
   See:
      http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#object-primitives
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode exposing (Decoder)
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Primitives"
        [ test "Decode.field accesses a field within a JSON object" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo (Decode.string |> Decode.field "last")
                        """{ "first": "Jean-Luc", "last": "Picard" }"""
        , test "Decode.at allows you to access a nested field" <|
            \_ ->
                123
                    |> expectDecodesTo
                        (Decode.int
                            |> Decode.at [ "square", x____replace me____x ]
                        )
                        """{"square": {"length": 123}}"""
        ]
