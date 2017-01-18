instance creation
describedBy: aDescription

	self
		deprecated: 'Use AsynchronicButtonWebView'
		transformWith: ' ButtonWebView describedBy: `@aDescription' -> 'AsynchronicButtonWebView labeled: `@aDescription  applying:  (ComponentScriptCommand toExecute: [ :aCanvas | aCanvas jQuery this button text: `@aDescription ])'.
	^ AsynchronicButtonWebView labeled: aDescription applying: (self textButtonCommandFor: aDescription)