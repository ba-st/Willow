tests-Events
testOnChanged

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect onChanged: JSFunction new ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker().on("changed.bs.select",function(){});</script>'