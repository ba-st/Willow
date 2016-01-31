processing
updateCombinedHolderToBeExplainedBy: explanations and: combinedExplanations

	combinedHolder := UnusedHolder explainedByAll: ((OrderedCollection new)
						addAll: combinedExplanations;
						addAll: explanations;
						yourself)