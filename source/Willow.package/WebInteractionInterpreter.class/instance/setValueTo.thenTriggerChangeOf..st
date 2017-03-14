configuring
setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				triggeringChangesObtainingIdentifierFrom: [ anIdentifiedView identifier ]
				valueFrom: aValueProvider)