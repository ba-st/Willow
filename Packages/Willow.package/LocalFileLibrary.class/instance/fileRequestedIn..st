accessing - private
fileRequestedIn: aRequestContext

	^String streamContents: 
			[:stream |
			aRequestContext consumer upToEnd do: [:each | stream nextPutAll: each]
				separatedBy: [stream nextPutAll: self fileNameSeparator]]