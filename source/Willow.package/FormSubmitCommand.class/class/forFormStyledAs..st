instance creation
forFormStyledAs: aCssStyle

	^ self findingComponentUsing: [ :aCanvas | aCanvas jQuery cssSelector: (CssUniversalSelector implicit form class: aCssStyle) ]