tests-processing
testApplyToOn

	| html |

	html := self apply: (ComponentClassificationCommand toStyleWith: 'ui') toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="ui"></div>'