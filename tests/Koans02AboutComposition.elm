module Koans02AboutComposition exposing (suite)

{-
   Hint: you may need some parentheses when you replace the blankDecoder in these
   examples. You'll need to pass in an argument to each of the composite decoders.
   See:
    http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#data-structures
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode
import Utils.Test exposing (Test, describe, test)


suite : Test
suite =
    describe "About Composition"
        [ test "Decode.list takes one of the primitive decoders as an argument and applies it to each element" <|
            \() ->
                [ 123, 456 ]
                    |> expectDecodesTo (Decode.list blankDecoder) "[123, 456]"
        , test "An empty list could be a list of anything so any primitive will fit there" <|
            \() ->
                []
                    |> expectDecodesTo (blankCompositeDecoder Decode.string) "[]"
        , test "Decode.nullabe takes one of the primitive decoders and turns it into a Maybe" <|
            \() ->
                Just 12345
                    |> expectDecodesTo (blankCompositeDecoder Decode.int) "12345"
        , test "Decode.nullable will decode null into Nothing" <|
            \() ->
                x____replace me____x
                    |> expectDecodesTo (Decode.nullable Decode.int) "null"
        ]
