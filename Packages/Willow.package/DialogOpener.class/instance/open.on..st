actions
open: aDialogView on: aCanvas
	^ (aCanvas jQuery class: WillowCssStyles dialogContainer) first append: [ :aSubCanvas | aSubCanvas render: aDialogView ]