accessing
serverIndependentActions

	^ Array
		with: [ :script :canvas | 
			script
				<< ((self componentToDisableOn: canvas) html assignTo: self disabledComponentVariableName).
			script
				<<
					((self componentToDisableOn: canvas)
						addClass: WillowCssStyles disabledComponent;
						attributeAt: self disabledAttributeName put: true;
						html: viewWhileDisabled) ]