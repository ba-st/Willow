accessing - private
functionToRemoveComponentOn: aCanvas

	^ aCanvas jQuery this remove
		,
			((aCanvas jQuery id: WillowConstants dialogSectionName)
				html: [ :aSubCanvas |  ])