processing - private
obtain: clientSideParameter from: anAsynchronousCall

	anAsynchronousCall
		bePost;
		callback: [ :serverSideParameter | serverSideParameterBinding := Binding to: serverSideParameter ]
			json: clientSideParameter