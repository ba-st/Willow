tests-Options
testMobile

	| html |

	html := self renderSelectApplying: [ :bootstrapSelect | bootstrapSelect mobile: true ].

	self assert: html equals: '<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"mobile":true});</script>'