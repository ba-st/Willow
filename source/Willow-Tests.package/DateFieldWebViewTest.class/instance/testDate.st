tests
testDate

	| field html currentDate |

	field := DateFieldWebView applying: [  ].

	self should: [ field date ] raise: InstanceCreationFailed.

	currentDate := Date newDay: 1 month: 1 year: 2001.
	field changeDateTo: currentDate.

	self assert: field date equals: currentDate.
	html := self render: field.

	self assert: html equals: '<input value="2001-01-01" name="1" type="date"/>'