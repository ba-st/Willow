accessing
modelLoadingActions

	^Array with: 
			[:aScript :aCanvas |
			aScript << (((aCanvas jQuery class: cssStyle) effect)
						toggle;
						perform: effect)]