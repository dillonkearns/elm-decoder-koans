module PathToEnlightenment exposing (koans, suite)

import Koans01AboutPrimitives
import Koans02AboutComposition
import Koans03AboutMapping
import Koans04AboutFields
import Koans05AboutMultipleFields
import Koans06AboutDecodePipeline
import Test as ElmTest
import Utils.Test as KoansTest


{-|


# Welcome, to the Elm Decoder Koans!

    If you're looking for the actual exercises, you'll want to start with

        tests/Koans01AboutExpects.elm

    If you're adding a new koan, just add it to the list below!

-}
koans : List KoansTest.Test
koans =
    [ Koans01AboutPrimitives.suite
    , Koans02AboutComposition.suite
    , Koans03AboutMapping.suite
    , Koans04AboutFields.suite
    , Koans05AboutMultipleFields.suite
    , Koans06AboutDecodePipeline.suite
    ]


{-|

    Exposed for [elm-test](https://github.com/rtfeldman/node-test-runner)

-}
suite : ElmTest.Test
suite =
    ElmTest.describe "The Elm Decoder Koans"
        (List.map KoansTest.asCanonical koans)
