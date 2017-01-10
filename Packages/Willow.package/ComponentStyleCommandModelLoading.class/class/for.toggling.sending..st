instance creation
for: aComponentByStyleName toggling: aCssStyle sending: anEffectSelector

	^self
		on: [:aCanvas | aCanvas jQuery class: aComponentByStyleName]
		altering: aCssStyle
		sending: #toggleClass:
		using: 
			[:component |
			(component effect)
				times: 1;
				slow;
				perform: anEffectSelector]