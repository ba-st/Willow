tests
testConditionalCommand

	| html |

	html := self apply: [ :field | field when: [ true ] apply: field beReadOnly ] asWebComponentCommand toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input readonly="readonly" type="text"/>'.

	html := self apply: [ :field | field when: [ false ] apply: field beReadOnly ] asWebComponentCommand toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="text"/>'