tests-accessing
testInstallAsFileHandlerAccordingTo

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WillowFileHandler installAsFileHandlerAccordingTo: WillowApplicationInDevelopment new.
			self
				assert: (handler libraries includes: WillowTestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler ]