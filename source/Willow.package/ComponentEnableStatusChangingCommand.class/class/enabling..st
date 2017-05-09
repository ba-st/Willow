Instance Creation
enabling: anIdentifiedComponent

	^self
		obtainingComponentWith: [:canvas | canvas jQuery id: anIdentifiedComponent identifier]
		settingStatusTo: false