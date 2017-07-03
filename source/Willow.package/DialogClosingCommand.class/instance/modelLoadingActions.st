accessing
modelLoadingActions

	^ Array
		with: [ :aScript :aCanvas | 
			aCanvas session componentSupplier
				addStatementsTo: aScript
				toCloseDialogsIn: (aCanvas jQuery id: WillowConstants dialogSectionName)
				matching: dialogSupplier
				on: aCanvas ]