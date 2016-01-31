accessing - private
fill: aScript on: aCanvas withActionsHandling: aSignal

	
	[aSignal commandsOnFailure do: 
			[:command |
			command serverIndependentActions
				do: [:action | action value: aScript value: aCanvas].
			command clientIndependentActions do: [:action | action value].
			command modelLoadingActions
				do: [:action | action value: aScript value: aCanvas]]]
			on: Error
			do: 
				[:ex |
				self toDo: 'Error while handling errors!'.
				ex return]