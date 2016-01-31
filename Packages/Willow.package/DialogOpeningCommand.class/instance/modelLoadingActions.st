accessing
modelLoadingActions

	^Array with: 
			[:aScript :aCanvas |
			aScript << (aCanvas jQuery id: WebViewSections dialogSectionName)
				append: [:aSubCanvas | aSubCanvas render: dialogView]]