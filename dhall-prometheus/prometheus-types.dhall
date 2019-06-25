
let KVPair : Type = { mapKey : Text, mapValue : Text }

let Alert
    : Type
    = { alert :
          Text
      , expr :
          Text
      , for :
          Text
      , labels :
          List KVPair
      , annotations :
          List KVPair
      }

in  { Alert = Alert }
