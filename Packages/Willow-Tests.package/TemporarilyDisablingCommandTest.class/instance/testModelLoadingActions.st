tests-accessing
testModelLoadingActions

	self assert: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) modelLoadingActions isEmpty