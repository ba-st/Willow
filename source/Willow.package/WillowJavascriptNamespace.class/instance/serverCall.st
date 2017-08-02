Accessing
serverCall

	^ (WillowServerCall context: self renderContext owner: self)
		rendererClass: self rendererClass;
		yourself