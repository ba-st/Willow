accessing
base64String

	| stream |

	stream := WriteStream on: String new.

	segments do: [ :segment | stream nextPutAll: segment ].
	^ stream contents