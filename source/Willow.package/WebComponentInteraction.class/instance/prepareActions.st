initialization
prepareActions

	| serializationRequired |

	serializationRequired := false.
	self initializeActions.
	commands
		do: [ :aCommand | 
			self registerActionsOf: aCommand.
			serializationRequired := serializationRequired or: [ aCommand requiresSerialization ] ].
	serializationRequired
		ifTrue: [ self registerActionsOf: serializationCommand ]