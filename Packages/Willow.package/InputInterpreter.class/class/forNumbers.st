instance creation
forNumbers

	^ self
		translatingFrom: [ :string | string asNumber ]
		to: [ :number | number asString ]