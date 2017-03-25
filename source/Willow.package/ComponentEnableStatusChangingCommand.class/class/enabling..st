Instance Creation
enabling: anIdentifiedComponent

	[ anIdentifiedComponent identifier ]
		on: AssertionFailed
		do: [ :error | InstanceCreationFailed signalAll: error failures ].

	^ self obtainingComponentWith: [ :canvas | canvas jQuery id: anIdentifiedComponent identifier ] settingStatusTo: false