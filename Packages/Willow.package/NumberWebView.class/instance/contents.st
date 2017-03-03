accessing
contents

	self deprecated: 'Use a proper parser to convert the contents (that now are always an String) into a number'
	"	^ [ super contents asNumber ]
		on: Error
		do: [ :ex | ex return: 0 ]"