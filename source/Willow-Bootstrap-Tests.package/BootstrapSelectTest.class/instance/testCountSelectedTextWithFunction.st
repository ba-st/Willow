tests-Options
testCountSelectedTextWithFunction

	| html |

	html := self
		renderMultiSelectApplying: [ :bootstrapSelect | 
			bootstrapSelect
				countSelectedText:
					(JSFunction new
						arguments: #('selectedCount' 'totalCount');
						return: true;
						add: 'Something selected';
						yourself) ].

	self
		assert: html
		equals:
			'<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"countSelectedText":function(selectedCount,totalCount){return "Something selected"}});</script>'