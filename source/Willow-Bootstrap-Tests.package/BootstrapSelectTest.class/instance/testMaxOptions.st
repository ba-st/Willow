tests-Options
testMaxOptions

	| html |

	html := self
		renderMultiSelectApplying: [ :bootstrapSelect | 
			bootstrapSelect
				maxOptions: 5;
				maxOptionsText: 'Select no more than five items' ].

	self
		assert: html
		equals:
			'<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"maxOptions":5,"maxOptionsText":"Select no more than five items"});</script>'