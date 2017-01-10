Configuring - CSS
removeCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName
	self removeCssClass: aCssStyle fromComponentsMatching: [ :canvas | canvas jQuery class: aComponentByStyleName ]