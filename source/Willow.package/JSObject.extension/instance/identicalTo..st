*Willow-SeasideExtensions
identicalTo: anObject

	self
		addDecoration:
			(JSBinary new
				operator: '===';
				statement: anObject)