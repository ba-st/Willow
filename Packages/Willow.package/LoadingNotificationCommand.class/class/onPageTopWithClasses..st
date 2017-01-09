instance creation
onPageTopWithClasses: aCssClassCollection
	^ self
		executing:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: WillowConstants notificationSectionName)
						html: [ :aSubCanvas | 
							aSubCanvas div
								classes:
									(Array
										with: WillowCssStyles topPageNotification
										with: JQueryCssStyles uiStateFocus
										with: JQueryCssStyles uiWidget
										with: JQueryCssStyles uiWidgetHeader
										with: JQueryCssStyles uiCornerAll);
								with: 'Loading...' ] ])
		then:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: WillowConstants notificationSectionName)
						html: [ :aSubCanvas |  ] ])