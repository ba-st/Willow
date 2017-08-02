accessing - private
asynchronousCallToAffect: aCanvas

	| serverCall |

	serverCall := aCanvas jQuery willow serverCall.
	priorityActions do: [ :action | action value: serverCall value: aCanvas ].
	self complete: serverCall withResponseOn: aCanvas.
	^ serverCall