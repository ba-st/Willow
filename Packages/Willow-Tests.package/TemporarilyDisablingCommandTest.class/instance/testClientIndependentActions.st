tests-accessing
testClientIndependentActions

	self assert: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) clientIndependentActions isEmpty