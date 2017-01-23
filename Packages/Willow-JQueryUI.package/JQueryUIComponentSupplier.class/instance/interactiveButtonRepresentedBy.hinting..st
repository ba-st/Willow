accessing
interactiveButtonRepresentedBy: anIcon hinting: aText

	^ PhrasingContainerWebView
		obtainingContentFrom: [  ]
		applying:
			(CompositeComponentCommand
				applyingAll:
					{(ComponentTitleCommand toSet: aText).
					(ComponentClassificationCommand
						toStyleWithAll: (Array with: anIcon with: ERABasicCssStyles buttonSmall))})