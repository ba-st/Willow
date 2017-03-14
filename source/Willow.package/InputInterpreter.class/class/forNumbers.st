instance creation
forNumbers

	^ self
		translatingFrom: [ :string | Number readFrom: string ]
		to: [ :number | number asString ]