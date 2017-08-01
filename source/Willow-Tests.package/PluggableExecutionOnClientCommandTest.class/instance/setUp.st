initialization
setUp

	super setUp.
	commandAction := [ :parameter :somethingElse | self fail ].
	command := PluggableExecutionOnClientCommand executingOnly: commandAction