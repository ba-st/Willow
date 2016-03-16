printing
printOn: aStream

	cssClasses do: [ :cssClass | aStream nextPutAll: cssClass ] separatedBy: [ aStream space ]