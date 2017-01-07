processing - private
obtain: clientSideParameter from: anAsynchronousCall

	anAsynchronousCall
		type: 'POST';
		callback: [ :serverSideParameter | serverSideParameterHolder := Holder containing: serverSideParameter ] json: clientSideParameter