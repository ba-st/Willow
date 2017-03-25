tests
testWAUrlSlash

	| url |

	url := 'http://www.example.com' seasideUrl.
	self assert: url / 'api' equals: 'http://www.example.com/api' seasideUrl