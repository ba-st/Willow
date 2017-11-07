Installing
installAsFileHandlerAccordingTo: aDeploymentMode

	| libraries fileHandler |

	libraries := aDeploymentMode filter: WAAbstractFileLibrary libraries.
	fileHandler := self providing: libraries.
	^ self install: fileHandler