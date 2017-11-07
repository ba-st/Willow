tests-accessing
testInstallAsFileHandlerAccordingToServedAt

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WillowFileHandler installAsFileHandlerAccordingTo: WillowApplicationInDevelopment new servedAt: 'https://cdn.example.com' seasideUrl.
			self
				assert: (handler libraries includes: WillowTestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WillowTestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: 'https://cdn.example.com/testing-0.0.0' ]