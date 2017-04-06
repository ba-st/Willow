tests-Options
testWindowPaddingWithArray

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect windowPadding: #(1 2 3 4) ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"windowPadding":[1,2,3,4]});</script>'