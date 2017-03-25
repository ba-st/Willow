tests-accessing
testCantCreateWithNonIdentifiedView

	self renderUsing: [ :canvas | self should: [ ComponentEnableStatusChangingCommand enabling: canvas textInput ] raise: InstanceCreationFailed ]