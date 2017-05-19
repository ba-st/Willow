instance creation
forCurrentObject

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serializeThis ]