tests-applying
testApplyToOn

	| html |

	html := self
		apply: (ComponentScriptCommand toExecute: [ :canvas | canvas jQuery this clone ])
		toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input id="id1" type="text"/><script type="text/javascript">$("#id1").clone();</script>'