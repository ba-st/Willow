accessing - private
asynchronousCallToAffect: aCanvas

	| serverCall |

	serverCall := aCanvas jQuery serverCall.
	serverCall setOwner: WillowJavascriptNamespace new.
	priorityActions do: [ :action | action value: serverCall value: aCanvas ].
	self complete: serverCall withResponseOn: aCanvas.
	^ serverCall