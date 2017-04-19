Installing
installAsFileHandlerAccordingTo: aDeploymentMode

	| libraries fileHandler |

	libraries := aDeploymentMode filter: WAAbstractFileLibrary libraries.
	fileHandler := self providing: libraries.
	WAFileHandler default: fileHandler.
	WAAdmin defaultDispatcher register: fileHandler at: 'files'.
	^ fileHandler