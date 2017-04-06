tests-Options
testLiveSearchOptions

	| html |

	html := self
		renderSelectApplying: [ :bootstrapSelect | 
			bootstrapSelect
				liveSearch: true;
				liveSearchNormalize: true;
				liveSearchPlaceholder: 'Search...';
				liveSearchStyle: BootstrapSelectConstants startsWith ].

	self
		assert: html
		equals:
			'<select id="id1"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"liveSearch":true,"liveSearchNormalize":true,"liveSearchPlaceholder":"Search...","liveSearchStyle":"startsWith"});</script>'