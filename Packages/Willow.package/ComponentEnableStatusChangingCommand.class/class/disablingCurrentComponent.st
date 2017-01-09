Instance Creation
disablingCurrentComponent

	^self obtainingComponentWith: [:canvas | canvas jQuery this] settingStatusTo: true