configuring
setValueOfComponentWithId: identifier to: aValueProvider

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ identifier ]
				valueFrom: aValueProvider)