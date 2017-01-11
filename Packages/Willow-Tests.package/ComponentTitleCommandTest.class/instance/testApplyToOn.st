tests-processing
testApplyToOn

	| html |

	html := self apply: (ComponentTitleCommand toSet: 'image') toComponentDefinedBy: [ :canvas | canvas image ].
	self assert: html equals: '<img alt="" title="image"/>'