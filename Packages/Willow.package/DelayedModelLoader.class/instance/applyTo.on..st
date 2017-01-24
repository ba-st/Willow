evaluating
applyTo: aScript on: aCanvas

	self
		commandsDo: [ :command | command serverIndependentActions do: [ :action | action value: aScript value: aCanvas ] ];
		commandsDo: [ :command | command clientIndependentActions do: [ :action | action value ] ];
		commandsDo: [ :command | command modelLoadingActions do: [ :action | action value: aScript value: aCanvas ] ]