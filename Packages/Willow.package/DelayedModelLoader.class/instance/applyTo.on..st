evaluating
applyTo: aScript on: aCanvas
	self commandsDo: [ :command | command serverIndependentActions do: [ :action | action value: aScript value: aCanvas ] ].
	self commandsDo: [ :command | command clientIndependentActions do: [ :action | action value ] ].
	self commandsDo: [ :command | command modelLoadingActions do: [ :action | action value: aScript value: aCanvas ] ]