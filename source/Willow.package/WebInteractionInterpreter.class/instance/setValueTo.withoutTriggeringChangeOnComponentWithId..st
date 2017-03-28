configuring
setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ identifier ]
				valueFrom: aValueProvider)