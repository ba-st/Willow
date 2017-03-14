instance creation
for: anIdentifiedView

 	^self findingComponentUsing: [ :aCanvas | aCanvas jQuery id: anIdentifiedView identifier ]