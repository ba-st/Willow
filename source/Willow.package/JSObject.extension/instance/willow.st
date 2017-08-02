*Willow-SeasideExtensions
willow

	^ (WillowJavascriptNamespace context: self renderContext)
		rendererClass: self rendererClass;
		yourself