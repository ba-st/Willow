accessing - private
lastSegmentOf: aString

	| totalSize |

	totalSize := aString size.
	^ aString copyFrom: totalSize - (totalSize rem: self segmentSize) + 1 to: totalSize