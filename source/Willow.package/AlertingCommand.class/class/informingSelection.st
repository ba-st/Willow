instance creation
informingSelection

	^self obtainingMessageFrom: 
			[:aCanvas |
			(aCanvas jQuery this children: 'option:selected') call: 'text']