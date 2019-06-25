let Annotation : Type = {}

-- cannot make recursive type easily:
-- https://github.com/dhall-lang/dhall-lang/wiki/How-to-translate-recursive-code-to-Dhall
-- so just reference things with string
let TypeRef : Type = Text

let DataType : Type =
< Primitive: TypeRef
| List: TypeRef
| Class: TypeRef
>


let Field : Type = {
  name: Text,
  description : Text,
  type: DataType,
  required : Bool,
  annotations: List Annotation
}

let ClassSpec : Type = {
  id: Text,
  description: Text,
  fields: List Field
}

in {
  ClassSpec = ClassSpec,
  Annotation = Annotation,
  Field = Field,
  DataType = DataType
}
