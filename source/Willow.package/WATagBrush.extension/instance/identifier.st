*Willow-SeasideExtensions
identifier

	^ self id
		ifNil: [ AssertionFailed signal: 'The identifier was never assigned' ]
		ifNotNil: [ :id | id ]