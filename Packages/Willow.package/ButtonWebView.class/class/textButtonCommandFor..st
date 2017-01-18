accessing - private
textButtonCommandFor: aDescription

	self
		deprecated: 'Use ComponentScriptCommand'
		transformWith: 'ButtonWebView textButtonCommandFor: `@aDescription' -> 'ComponentScriptCommand toExecute: [ :aCanvas | aCanvas jQuery this button text: `@aDescription ]'.
	^ ComponentScriptCommand toExecute: [ :aCanvas | aCanvas jQuery this button text: aDescription ]