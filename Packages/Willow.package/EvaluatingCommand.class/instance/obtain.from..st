processing - private
obtain: clientSideParameter from: anAsynchronousCall

	anAsynchronousCall callback: 
			[:serverSideParameter |
			serverSideParameterHolder := Holder containing: serverSideParameter]
		json: clientSideParameter