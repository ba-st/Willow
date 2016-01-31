accessing
priorityActions
	"Si hay un parámetro se obtiene en base al json y se guarda para ser usado durante la ejecución del callback."

	^clientSideParameterHolder withContentDo: 
			[:clientSideParameter |
			Array
				with: [:anAsynchronousCall :aCanvas | self obtain: clientSideParameter from: anAsynchronousCall]]
		ifUnused: [:explanations | #()]