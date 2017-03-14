accessing
serverIndependentActions

	^Array with: 
			[:aScript :aCanvas |
			aScript << aCanvas javascript
				alert: (messageProvider value: aCanvas)]