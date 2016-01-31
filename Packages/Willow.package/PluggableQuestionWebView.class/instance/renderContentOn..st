rendering
renderContentOn: aCanvas

	aCanvas form
		doNotSubmit;
		with: [ 
					aCanvas fieldSet
						class: WillowCssStyles fieldAndLabel;
						with: answerView ]