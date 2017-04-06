tests-Options
testSelectedTextFormat

	| html |

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect selectedTextFormat: BootstrapSelectConstants values ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"selectedTextFormat":"values"});</script>'.

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect selectedTextFormat: BootstrapSelectConstants static ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"selectedTextFormat":"static"});</script>'.

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect selectedTextFormat: BootstrapSelectConstants count ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"selectedTextFormat":"count"});</script>'.

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect selectedTextFormat: (BootstrapSelectConstants countAfter: 3) ].

	self
		assert: html
		equals: '<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"selectedTextFormat":"count > 3"});</script>'