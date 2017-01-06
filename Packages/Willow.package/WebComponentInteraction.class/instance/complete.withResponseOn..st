accessing - private
complete: anAsynchronousCall withResponseOn: aCanvas
	anAsynchronousCall
		script: [ :subScript | 
			[ clientIndependentActions do: [ :action | action value ].
			modelLoadingActions do: [ :action | action value: subScript value: aCanvas ] ]
				on: WebInteractionCommandFailed - self class exceptionsToIgnore
				do: [ :aSignal | aSignal return: (self fill: subScript on: aCanvas withActionsHandling: aSignal) ] ]