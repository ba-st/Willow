processing
updateUnusedCombinedHolderExplainedBy: combinedExplanations considering: holder

	holder
		withContentDo: [:content | self updateCombinedHolderToHold: content]
		ifUnused: 
			[:explanations |
			self updateCombinedHolderToBeExplainedBy: explanations
				and: combinedExplanations]