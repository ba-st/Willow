tests-Events
testOnShown

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect onShown: JSFunction new ].

	self
		assert: html
		equals: '<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker().on("shown.bs.select",function(){});</script>'