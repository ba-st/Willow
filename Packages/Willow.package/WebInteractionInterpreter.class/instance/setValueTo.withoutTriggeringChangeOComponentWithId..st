configuring
setValueTo: aValueProvider withoutTriggeringChangeOComponentWithId: identifier

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ identifier ]
				valueFrom: aValueProvider)