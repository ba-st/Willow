evaluating
applyTo: aScript on: aCanvas

	commands do: [ :command | command modelLoadingActions do: [ :action | action value: aScript value: aCanvas ] ]