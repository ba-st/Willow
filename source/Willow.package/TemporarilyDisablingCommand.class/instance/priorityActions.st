accessing
priorityActions

	^ Array
		with: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				onComplete:
					((aCanvas jQuery class: WillowCssStyles disabledComponent)
						attributeAt: self disabledAttributeName put: false;
						removeClass: WillowCssStyles disabledComponent;
						call: 'html' with: (aCanvas jQuery alias: self disabledComponentVariableName)) ]