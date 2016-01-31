instance creation
new

	^self
		triggerUsing: [:anAsynchronousCall :aCanvas | aCanvas jQuery this onClick: anAsynchronousCall]