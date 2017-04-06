tests-Options
testMultipleSeparator

	| html |

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect multipleSeparator: '/ ' ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"multipleSeparator":"/ "});</script>'