*Willow-Tests
apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider

	^ self
		apply: aWebInteractionObject
		toComponentDefinedBy: aComponentProvider
		afterApplyingDo: [ :canvas :component |  ]