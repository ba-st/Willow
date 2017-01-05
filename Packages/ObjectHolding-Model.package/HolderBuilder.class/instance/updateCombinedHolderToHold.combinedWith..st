processing - private
updateCombinedHolderToHold: content combinedWith: combinedContent

	combinedHolder := Holder
				containing: (combinationBlock value: combinedContent value: content)