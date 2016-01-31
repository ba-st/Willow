accessing - private
complete: anAsynchronousCall withResponseOn: aCanvas

	| result |
	result :=
			[:subScript |
			
			[clientIndependentActions do: [:action | action value].
			modelLoadingActions do: [:action | action value: subScript value: aCanvas]]
					on: WebInteractionCommandFailed
					do: 
						[:aSignal |
						aSignal
							return: (self fill: subScript on: aCanvas withActionsHandling: aSignal)]].
	anAsynchronousCall script: result