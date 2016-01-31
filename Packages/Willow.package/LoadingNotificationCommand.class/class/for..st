instance creation
for: anIdentifiedView

	^self
		executing: (Array with: 
					[:aScript :aCanvas |
					aScript << (aCanvas jQuery id: anIdentifiedView id) html: 
							[:theCanvas |
							(theCanvas div)
								class: WillowCssStyles loading;
								with: [theCanvas image url: LocalFileLibrary / #'loading.gif']]])