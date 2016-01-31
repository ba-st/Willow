instance creation
for: aCallbackBlock handling: anException byExecuting: aCommandCollection

	^ self
		for: [ 
			aCallbackBlock
				on: anException
				do: [ :ex | WebInteractionCommandFailed signal: aCommandCollection ] ]