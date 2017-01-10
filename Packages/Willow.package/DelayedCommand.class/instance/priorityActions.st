accessing
priorityActions

	"If there's some parameter, we got it from the json and keep it to be used during callback execution"

	^ clientSideParameterHolder
		withContentDo: [ :clientSideParameter | 
			Array
				with:
					[ :anAsynchronousCall :aCanvas | self obtain: clientSideParameter from: anAsynchronousCall ] ]
		ifUnused: [ #() ]