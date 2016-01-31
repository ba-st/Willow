accessing - private
contentsFoundAt: filename

	^GRPlatform current contentsOfFile: filename
		binary: (self class isBinaryAt: filename)