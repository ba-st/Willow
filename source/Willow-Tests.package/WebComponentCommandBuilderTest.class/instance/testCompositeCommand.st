tests
testCompositeCommand

	| html |

	html := self
		apply: (self commandBuilder script js: [ :canvas | canvas jQuery this clone ]) + self commandBuilder passwordInputMode
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="password"/><script type="text/javascript">$("#id1").clone();</script>'