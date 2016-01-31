accessing
for: aString

	| camelCase fileName |

	camelCase := aString asCamelCase.
	fileName := camelCase copyUpToLast: $#.
	^ '<1s>.png' expandMacrosWith: fileName 