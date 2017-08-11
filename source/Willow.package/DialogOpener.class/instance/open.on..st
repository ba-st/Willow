actions
open: aDialogView on: aCanvas

	^ (aCanvas jQuery id: WillowConstants dialogSectionName) append: [ :aSubCanvas | aSubCanvas render: aDialogView ]