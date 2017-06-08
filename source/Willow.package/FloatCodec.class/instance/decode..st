converting
decode: aString

	| number |

	number := Float readFrom: aString ifFail: [ InstanceCreationFailed signal: ('<1s> is not a decimal number' expandMacrosWith: aString) ].
	^ number