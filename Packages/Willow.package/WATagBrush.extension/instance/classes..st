*Willow-Model-SeasideExtensions
classes: aCssStyleCollection

	self
		class:
			(String
				streamContents: [ :stream | 
					aCssStyleCollection
						do: [ :cssStyle | stream nextPutAll: cssStyle asString ]
						separatedBy: [ stream space ] ])