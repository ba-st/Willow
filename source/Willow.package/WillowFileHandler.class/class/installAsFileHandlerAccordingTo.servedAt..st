Installing
installAsFileHandlerAccordingTo: aDeploymentMode servedAt: aURL

	| libraries fileHandler |

	libraries := aDeploymentMode filter: WAAbstractFileLibrary libraries.
	fileHandler := self providing: libraries baseUrlForLibraryOptional: (Optional containing: aURL).
	^ self install: fileHandler