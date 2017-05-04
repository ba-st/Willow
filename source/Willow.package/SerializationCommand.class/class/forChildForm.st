instance creation
forChildForm

	^ self
		executing:
			(Array
				with: [ :anAsynchronousCall :aCanvas | 
					anAsynchronousCall
						type: 'POST';
						serialize: (aCanvas jQuery this children: 'form') ])