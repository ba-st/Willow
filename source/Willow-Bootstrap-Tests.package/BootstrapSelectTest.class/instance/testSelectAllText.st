tests-Options
testSelectAllText

	| html |

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect selectAllText: 'Select All' ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"selectAllText":"Select All"});</script>'