-- alert with the (typed) labels we want
let StaticTypedAlert
    : Type
    = { alert :
          Text
      , expr :
          Text
      , for :
          Text
      , labels :
          { owner : Text, severity : Text }
      , annotations :
          { summary : Text, description : Text, dc : Text }
      }

let ConsumerGroupLagArg
    : Type
    = { alert :
          Text
      , topic :
          Text
      , consumerGroup :
          Text
      , threshold :
          Natural
      , for :
          Text
      , severity :
          Text
      , summary :
          Text
      , description :
          Text
      }

let maxConsumerGroupLag
    : ConsumerGroupLagArg → StaticTypedAlert
    =   λ ( args
          : ConsumerGroupLagArg
          )
      → { alert =
            args.alert
        , expr =
            "max(kafka_consumergroup_lag{consumergroup=\"${args.consumerGroup}\",topic=\"${args.topic}\"}) by (topic,consumergroup,dc) > ${Natural/show
                                                                                                                                           args.threshold}"
        , for =
            args.for
        , labels =
            { owner = "proddev", severity = args.severity }
        , annotations =
            { summary =
                args.summary
            , description =
                args.description
            , dc =
                "{{ \$labels.dc }}"
            }
        }

in  { maxConsumerGroupLag = maxConsumerGroupLag }
