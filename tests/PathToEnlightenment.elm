module PathToEnlightenment exposing (koans, suite)

import Koan01AboutPrimitives
import Koan02AboutComposition
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
    [ Koan01AboutPrimitives.suite
    , Koan02AboutComposition.suite
    ]


{-|

    Exposed for [elm-test](https://github.com/rtfeldman/node-test-runner)

-}
suite : ElmTest.Test
suite =
    ElmTest.describe "The Elm Decoder Koans"
        (List.map KoansTest.asCanonical koans)
