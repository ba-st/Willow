instance creation
forFormStyledAs: aCssStyle

	^ self findingComponentUsing: [ :aCanvas | aCanvas jQuery class: aCssStyle ]