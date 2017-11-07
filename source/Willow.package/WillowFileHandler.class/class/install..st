private-Installing
install: fileHandler

	WAFileHandler default: fileHandler.
	WAAdmin defaultDispatcher register: fileHandler at: 'files'.
	^ fileHandler