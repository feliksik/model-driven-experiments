let lib = ./abstraction-types.dhall

let highPrioDefaults = { for = "5m", severity = "high" }

in  { groups =
        [ lib.maxConsumerGroupLag
          (   highPrioDefaults
            ⫽ { alert =
                  "alertname"
              , topic =
                  "topic"
              , consumerGroup =
                  "consumerGroup"
              , threshold =
                  242
              , summary =
                  "this is a test"
              , description =
                  ''
                  this is quite
                  a long test
                  ''
              }
          )
        ]
    }
