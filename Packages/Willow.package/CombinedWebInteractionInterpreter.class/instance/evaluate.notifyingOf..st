configuring
evaluate: aCallbackBlock notifyingOf: anException

	interpreters do: [:anInterpreter | anInterpreter evaluate: aCallbackBlock notifyingOf: anException]