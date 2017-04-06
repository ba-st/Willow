tests-Options
testDropdownAlignRight

	| html |

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect dropdownAlignRight: BootstrapSelectConstants auto ].

	self
		assert: html
		equals:
			'<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"dropdownAlignRight":"auto"});</script>'.

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect dropdownAlignRight: true ].

	self
		assert: html
		equals:
			'<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"dropdownAlignRight":true});</script>'