tests-accessing
testServerIndependentActions

	self assert: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) serverIndependentActions isEmpty