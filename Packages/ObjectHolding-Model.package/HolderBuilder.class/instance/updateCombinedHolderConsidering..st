processing
updateCombinedHolderConsidering: holder

	combinedHolder withContentDo: 
			[:combinedContent |
			self updateCombinedHolderHolding: combinedContent considering: holder]
		ifUnused: 
			[:combinedExplanations |
			self updateUnusedCombinedHolderExplainedBy: combinedExplanations
				considering: holder]