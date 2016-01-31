instance creation
for: aCallbackBlock notifyingOf: anException

	^ self
		for: [ 
			aCallbackBlock
				on: anException
				do: [ :ex | WebInteractionCommandFailed signal: (Array with: (AlertingCommand stating: ex messageText)) ] ]