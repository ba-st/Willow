accessing
modelLoadingActions

	^ Array
		with:
			[ :aScript :aCanvas | aScript << (aCanvas session componentSupplier closeDialogsIn: (aCanvas jQuery id: WillowConstants dialogSectionName) suppliedBy: dialogSupplier on: aCanvas) ]