accessing
serverIndependentActions

	^Array with: [:aScript :aCanvas |
		aScript << (componentProvider value: aCanvas)
			propertyAt: WillowConstants disabledAttributeName
			put: desiredStatus]