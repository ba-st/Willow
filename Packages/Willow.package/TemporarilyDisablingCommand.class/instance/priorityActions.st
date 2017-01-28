accessing
priorityActions

	^Array with: [:anAsynchronousCall :aCanvas |
		anAsynchronousCall addParameter:
			((self componentToDisableOn: aCanvas) html assignTo: self disabledComponentVariableName).
		anAsynchronousCall addParameter: (
			(self componentToDisableOn: aCanvas)
				addClass: WillowCssStyles disabledComponent;
				attributeAt: self disabledAttributeName put: true;
				html: viewWhileDisabled).
		anAsynchronousCall onComplete: (
			(aCanvas jQuery class: WillowCssStyles disabledComponent)
				attributeAt: self disabledAttributeName put: false;
				removeClass: WillowCssStyles disabledComponent;
				call: 'html' with: (aCanvas jQuery alias: self disabledComponentVariableName))]