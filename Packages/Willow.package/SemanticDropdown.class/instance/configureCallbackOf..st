configuring - private
configureCallbackOf: anInput

	anInput
		callback: [ :string | 
			selectionHolder := Holder
				containing: (options at: string forcedAsNumber) ]