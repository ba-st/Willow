instance creation
synchronicLabeled: aRenderable applying: aComponentCommand

	"We send the private message to ensure that all instances are declared as either synchronic or asynchronic"
	^ self labeled: aRenderable applying: aComponentCommand