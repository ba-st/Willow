instance creation
for: aComponentByStyleName removing: aCssStyle

	^self
		on: [:aCanvas | aCanvas jQuery class: aComponentByStyleName]
		altering: aCssStyle
		sending: #removeClass:
		using: [:component | component]