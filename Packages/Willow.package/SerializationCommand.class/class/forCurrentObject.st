instance creation
forCurrentObject

	^self executing: (Array
				with: [:anAsynchronousCall :aCanvas | anAsynchronousCall serializeThis])