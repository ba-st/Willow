tests
testTagBrushClasses

	| html |

	html := self render: [ :canvas | canvas div classes: #('a' 'b') ].
	self assert: html equals: '<div class="a b"></div>'