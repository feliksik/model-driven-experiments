default: 
	dhall --explain <<< './toapi.dhall ./example-model.dhall'  | dhall-to-yaml | yaml2json | jq .
