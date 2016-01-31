instance creation
for: anIdentifiedView

	^self
		findingComponentUsing: [:aCanvas | aCanvas jQuery id: anIdentifiedView identifier]
"findingComponentUsing: [:aCanvas | ((aCanvas jQuery id: anIdentifiedView identification) find: 'input') property: 0]"
"aCanvas jQuery
				expression: ('$($('#<1s>').find('input')[0])'
						expandMacrosWith: identifiedView identification) focus"