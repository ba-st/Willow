configuring
setValueOf: anIdentifiedView to: aValueProvider

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ anIdentifiedView identifier ]
				valueFrom: aValueProvider)