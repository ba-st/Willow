instance creation
for: aCallbackBlock handling: anException byExecuting: aCommandCollection
	^ self
		for: [ aCallbackBlock
				on: anException
				do: [ :exception | WebInteractionCommandFailed signalToExecute: aCommandCollection asHandlingOf: exception ] ]