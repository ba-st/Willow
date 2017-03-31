accessing
serverIndependentActions

	^ Array
		with:
			[ :aScript :aCanvas | aScript << (aCanvas jQuery class: JQueryCssStyles uiDialogContent) dialog close ]