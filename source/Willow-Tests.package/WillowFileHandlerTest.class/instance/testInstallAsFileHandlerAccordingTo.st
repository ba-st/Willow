tests-accessing
testInstallAsFileHandlerAccordingTo

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WillowFileHandler installAsFileHandlerAccordingTo: WillowApplicationInDevelopment new.
			self
				assert: (handler libraries includes: WillowTestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WillowTestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: '/files/testing-0.0.0' ]