*Willow-SeasideExtensions
equalTo: anObject

	self
		addDecoration:
			(JSBinary new
				operator: '==';
				statement: anObject)