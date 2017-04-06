tests-Options
testContainer

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect container: 'body' ].

	self assert: html equals: '<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"container":"body"});</script>'