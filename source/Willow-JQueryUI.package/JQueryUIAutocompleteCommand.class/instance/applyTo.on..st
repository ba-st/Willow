processing
applyTo: aComponent on: aCanvas

	^ (ComponentScriptCommand toExecute: scriptProvider) applyTo: aComponent on: aCanvas