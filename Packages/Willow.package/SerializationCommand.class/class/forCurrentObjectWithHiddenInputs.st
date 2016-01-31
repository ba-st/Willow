instance creation
forCurrentObjectWithHiddenInputs

	^self executing: (Array
				with: [:anAsynchronousCall :aCanvas | anAsynchronousCall serializeThisWithHidden])