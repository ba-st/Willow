accessing
clientIndependentActions

	^Array with: 
			[serverSideParameterHolder
				withContentDo: [:serverSideParameter | callbackToEvaluate value: serverSideParameter]
				ifUnused: [:explanations | callbackToEvaluate value]]