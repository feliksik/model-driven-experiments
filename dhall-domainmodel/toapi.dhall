let types = ./model-type.dhall
let openapi = ./openapi3-types.dhall

let map = https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/List/map

let flatMap = https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/List/concatMap

let identity
      : ∀(a : Type) -> a -> a
      = \(a : Type) ->  \(x : a) -> x

let typeToText : types.DataType -> Text
  = \( dt : types.DataType )
  -> merge {
        Primitive = identity Text,
        Class = identity Text,
        List = identity Text
     }
     dt

let toProperty : types.Field -> openapi.Property =
  \(f : types.Field ) ->
  {
    mapKey = f.name,
    mapValue = {
      type = typeToText f.type,
      description = f.description,
      example = ""
    }
  }

let toRequiredFields
    : types.ClassSpec -> List Text
    = \( spec : types.ClassSpec ) ->
      flatMap types.Field Text (
        \( f : types.Field ) -> if f.required then [ f.name ] else  ( [] : List Text ) )
        spec.fields

let toApiModelType
    : types.ClassSpec → openapi.ModelType
    =   λ(spec : types.ClassSpec)
      → {
           description = spec.description,
           required = toRequiredFields spec,
           -- properties = [] : List openapi.Property --
           properties = map types.Field openapi.Property toProperty spec.fields
         }



let toApi = \(classes : List types.ClassSpec) ->
    map types.ClassSpec openapi.ModelType toApiModelType classes

in toApi
