instance creation
executingOnly: aServerIndependentAction

	^self executingAll: (Array with: aServerIndependentAction)