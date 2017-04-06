tests-Options
testWidthInCssUnits

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect width: 10 px  ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"width":"10px"});</script>'