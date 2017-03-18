instance creation
forLabeledFieldNamed: aName containing: aView

	^ self
		forComponentBuiltUsing: [ :canvas | 
			canvas fieldSet
				class: WillowCssStyles willow;
				yourself ]
		named: aName
		containing: aView