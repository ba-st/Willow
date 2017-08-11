private
obtain: clientSideParameter from: anAsynchronousCall

	self considerAddingConditionTo: anAsynchronousCall.
	anAsynchronousCall
		bePost;
		callback: [ :serverSideParameter | serverSideParameterBinding := Binding to: serverSideParameter ]
			json: clientSideParameter