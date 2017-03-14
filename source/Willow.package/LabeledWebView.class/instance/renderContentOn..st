rendering
renderContentOn: aCanvas

	(aCanvas label)
		title: title;
		with: 
				[self identifyComponentOn: aCanvas.
				aCanvas
					render: label;
					render: viewToLabel]