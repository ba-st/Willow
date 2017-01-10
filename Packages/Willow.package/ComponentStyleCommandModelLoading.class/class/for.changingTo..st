instance creation
for: aComponentByStyleName changingTo: aCssStyle

	^ self
		on: [ :aCanvas | aCanvas jQuery class: aComponentByStyleName ]
		altering: aComponentByStyleName
		sending: #removeClass:
		using: [ :component | component addClass: aCssStyle ]