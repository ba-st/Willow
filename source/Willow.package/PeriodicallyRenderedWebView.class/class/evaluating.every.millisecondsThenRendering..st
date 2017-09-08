Instance Creation
evaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aViewToRender

	^ self
		evaluating: aRefreshCommand
		every: aNumber
		millisecondsThenRendering: aViewToRender
		until: [ false ]