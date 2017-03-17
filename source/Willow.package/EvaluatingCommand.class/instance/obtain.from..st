processing - private
obtain: clientSideParameter from: anAsynchronousCall

	anAsynchronousCall
		type: 'POST';
		callback: [ :serverSideParameter | serverSideParameterBinding := Binding to: serverSideParameter ] json: clientSideParameter