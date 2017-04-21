*Willow-SeasideExtensions
anonymousSubResourceIntegrity: theIntegrityMetadata

	self
		attributeAt: 'integrity' put: theIntegrityMetadata;
		attributeAt: 'crossorigin' put: 'anonymous'