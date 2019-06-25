let Property : Type = {
  mapKey: Text,
  mapValue: {
    type: Text,
    description: Text,
    example: Text
  }
}

let ModelType : Type =
  {
    description: Text,
    required : List Text,
    properties: List Property
  }


in {
  ModelType = ModelType,
  Property = Property
}
