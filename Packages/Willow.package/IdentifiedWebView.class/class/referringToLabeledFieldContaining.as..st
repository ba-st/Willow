instance creation
referringToLabeledFieldContaining: aView as: aName

	^ self new
		initializeReferringTo: aView
		as: aName
		obtainingContainerComponentFrom: [ :canvas | 
			canvas fieldSet
				class: WillowCssStyles fieldAndLabel;
				yourself ]