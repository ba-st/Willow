Instance Creation
enabling: aComponent

	aComponent
		ifNil: [ Error signal: 'View initialization order is incorrect, please review' ].
	^ self
		obtainingComponentWith: [ :canvas | canvas jQuery id: aComponent id ]
		settingStatusTo: false