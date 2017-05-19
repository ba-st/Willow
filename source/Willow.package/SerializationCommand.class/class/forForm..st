instance creation
forForm: anIdentifiedForm

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serialize: (aCanvas jQuery id: anIdentifiedForm identifier) ]