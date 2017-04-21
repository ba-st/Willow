converting
decode: aString

	^ [ Date readFrom: aString pattern: 'yyyy-mm-dd' ]
		on: DateError
		do: [ :error | InstanceCreationFailed signal: error messageText ]