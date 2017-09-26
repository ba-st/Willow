tests
testBlockExtension

	| html |

	html := self
		apply: [ :command | (command addScript js: [ :canvas | canvas jQuery this clone ]) + command bePasswordInput ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="password"/><script type="text/javascript">$("#id1").clone();</script>'