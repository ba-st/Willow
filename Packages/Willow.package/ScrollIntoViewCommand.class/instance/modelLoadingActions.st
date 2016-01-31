accessing
modelLoadingActions

	^Array with: 
			[:aScript :aCanvas |
			aScript << ((aCanvas jQuery id: self identifierToShow) property: 0)
				call: 'scrollIntoView']