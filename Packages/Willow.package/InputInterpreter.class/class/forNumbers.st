instance creation
forNumbers

	^ self
		translatingFrom: [ :string | string forcedAsNumber ]
		to: [ :number | number asString ]