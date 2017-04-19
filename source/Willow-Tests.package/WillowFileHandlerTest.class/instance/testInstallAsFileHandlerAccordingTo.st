tests-accessing
testInstallAsFileHandlerAccordingTo

	| handler |

	handler := WillowFileHandler installAsFileHandlerAccordingTo: WillowApplicationInDevelopment new.

	self
		assert: (handler libraries includes: WillowTestingFileMetadataDevelopmentLibrary);
		assert: WAFileHandler default equals: handler