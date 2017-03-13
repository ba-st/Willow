private-rendering
renderRadioGroupOn: aCanvas

	aCanvas radioGroup
		callback: [ :element | self choose: element ];
		with: [ :radioGroup | 
			chosenElementHolder withContentDo: [ :chosenElement | radioGroup selected: chosenElement ].
			availableElements
				do: [ :element | self renderRadioButtonFor: element asPartOf: radioGroup on: aCanvas ] ]