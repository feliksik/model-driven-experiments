let types = ./model-type.dhall

in [
    { id = "Company"
    , description = "A Company"
    , fields =
      [ { annotations = [] : List types.Annotation
        , name = "companyName"
        , description = "The name of the company"
        , required = True
        , type = types.DataType.Primitive "string"
        }
      , { annotations = [] : List types.Annotation
        , name = "employees"
        , description = "The list of employees that work at this company"
        , required = False
        , type = types.DataType.List "xxx"
        }
      ]
    },
    { id = "Person"
    , description = "A Person"
    , fields =
      [ { annotations = [] : List types.Annotation
        , name = "name"
        , description = "The persons full name"
        , required = True
        , type = types.DataType.Primitive "string"
        }
      , { annotations = [] : List types.Annotation
        , name = "age"
        , description = "The persons age in years"
        , required = True
        , type = types.DataType.Primitive "int"
        }
      ]
    }
  ]
