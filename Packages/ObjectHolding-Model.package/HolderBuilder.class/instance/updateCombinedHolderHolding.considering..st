processing - private
updateCombinedHolderHolding: combinedContent considering: holder

	holder withContentDo: [ :content | self updateCombinedHolderToHold: content combinedWith: combinedContent ] ifUnused: [ "Una vez que tengo algún contenido, no me interesan los unused recibidos" ]