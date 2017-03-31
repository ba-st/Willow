initialize-release
initializeCommandToComponent

	commandToComponent := ComponentScriptCommand
		toExecute: [ :canvas | self dialogScriptOn: canvas ]