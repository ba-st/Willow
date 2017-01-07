accessing - private
asynchronousCallToAffect: aCanvas

	| asynchronousCall |

	asynchronousCall := aCanvas jQuery ajax.
	priorityActions do: [ :action | action value: asynchronousCall value: aCanvas ].
	self complete: asynchronousCall withResponseOn: aCanvas.
	self complete: aCanvas withErrorHandlingOn: asynchronousCall.
	^ asynchronousCall