accessing
modelLoadingActions

	^ Array with: [ :aScript :aCanvas | aScript << (aCanvas jQuery id: identifiedView identifier) remove ]