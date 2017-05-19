instance creation
forCurrentObjectWithHiddenInputs

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serializeThisWithHidden ]