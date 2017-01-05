processing - private
updateCombinedHolderHolding: combinedContent considering: holder

	holder withContentDo: 
			[:content |
			self updateCombinedHolderToHold: content combinedWith: combinedContent]
		ifUnused: 
			[:explanations |
			"Una vez que tengo algún contenido, no me interesan los unused recibidos"
			]