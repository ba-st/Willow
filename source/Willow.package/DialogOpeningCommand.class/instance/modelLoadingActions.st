accessing
modelLoadingActions

	^ Array
		with: [ :aScript :aCanvas | 
			aScript
				<<
					((aCanvas jQuery id: WillowConstants dialogSectionName)
						append: [ :aSubCanvas | aSubCanvas render: dialogView ]) ]