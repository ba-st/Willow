tests-accessing
testLibraries

	| libraries handler |

	libraries := Array with: WillowTestingFileMetadataDeploymentLibrary.
	handler := WillowFileHandler providing: libraries.

	self assert: handler libraries equals: libraries