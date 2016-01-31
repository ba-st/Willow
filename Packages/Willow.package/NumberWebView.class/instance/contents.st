accessing
contents

	^ [ super contents asNumber ]
		on: Error
		do: [ :ex | ex return: 0 ]