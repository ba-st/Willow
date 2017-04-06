tests-Options
testShowTick

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect showTick: true ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"showTick":true});</script>'