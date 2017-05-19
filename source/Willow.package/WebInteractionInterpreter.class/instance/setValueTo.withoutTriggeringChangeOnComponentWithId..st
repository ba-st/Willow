Configuring - DOM
setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ identifier ]
				valueFrom: aValueProvider)