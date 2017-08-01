initialization
setUp

	super setUp.
	command := ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ]
				altering: 'anExistingStyle'
				sending: #removeClass:
				using: [ :component | component addClass: 'aNewStyle' ]