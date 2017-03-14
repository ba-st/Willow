instance creation
forLabeledFieldNamed: aName containing: aView

	^ self
		forComponentBuiltUsing: [ :canvas | 
			canvas fieldSet
				class: WillowCssStyles fieldAndLabel;
				yourself ]
		named: aName
		containing: aView