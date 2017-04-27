converting
decode: aString

	| number |

	number := Integer readFrom: aString ifFail: [ InstanceCreationFailed signal: ('<1s> is not a natural number' expandMacrosWith: aString) ].
	AssertionChecker enforce: [ number positive ] because: [ '<1s> is not a natural number' expandMacrosWith: aString ] raising: InstanceCreationFailed.
	^ number