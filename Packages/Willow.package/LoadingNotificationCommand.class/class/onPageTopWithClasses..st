instance creation
onPageTopWithClasses: aCssClassCollection

	^ self
		executing:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: WillowConstants notificationSectionName)
						html: [ :aSubCanvas | 
							aSubCanvas div
								classes: aCssClassCollection;
								with: 'Loading...' ] ])
		then:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: WillowConstants notificationSectionName)
						html: [ :aSubCanvas |  ] ])