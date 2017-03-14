accessing
modelLoadingActions

	^ Array
		with: [ :aScript :aCanvas | 
			| jQueryInstance |

			jQueryInstance := aScript << (aCanvas jQuery id: identifierProvider value).
			jQueryInstance value: valueProvider value.
			triggeringAction cull: jQueryInstance ]