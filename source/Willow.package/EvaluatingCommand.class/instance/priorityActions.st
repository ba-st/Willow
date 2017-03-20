accessing
priorityActions

	"If there''s a parameter I will get it using JSON and save it to be used during callback execution"

	^ optionalClientSideParameter withContentDo: [ :clientSideParameter | Array with: [ :anAsynchronousCall :aCanvas | self obtain: clientSideParameter from: anAsynchronousCall ] ] ifUnused: [ #() ]