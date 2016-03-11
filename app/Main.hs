import Criterion.Main

main = defaultMain
       [ bgroup "one" [ bench "10"    $ nf one 10
                      , bench "100"   $ nf one 100
                      , bench "1000"  $ nf one 1000
                      , bench "10000" $ nf one 10000
                      ]
       , bgroup "two" [ bench "10"    $ nf two 10
                      , bench "100"   $ nf two 100
                      , bench "1000"  $ nf two 1000
                      , bench "10000" $ nf two 10000
                      ]
       , bgroup "three" [ bench "10"    $ nf three 10
                        , bench "100"   $ nf three 100
                        , bench "1000"  $ nf three 1000
                        , bench "10000" $ nf three 10000
                        ]
       ]

one :: Int -> Int
one n = sum [x^2 | x <- [1..n], x^2 < n*5]

two :: Int -> Int
two n = sum (filter (<(5*n)) [x^2 | x <- [1..n]])

three :: Int -> Int
three n = sum (filter (<(5*n)) (map (^2) [1..n]))

