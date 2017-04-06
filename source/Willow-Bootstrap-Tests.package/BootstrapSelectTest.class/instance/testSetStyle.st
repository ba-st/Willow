tests-Methods
testSetStyle

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect setStyle ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker("setStyle");</script>'