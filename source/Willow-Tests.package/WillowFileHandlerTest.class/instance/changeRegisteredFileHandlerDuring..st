private
changeRegisteredFileHandlerDuring: aBlock

	| installedHandler |

	installedHandler := WAFileHandler default.
	installedHandler unregister.

	aBlock
		ensure: [ WAFileHandler default: installedHandler.
			WAAdmin defaultDispatcher register: installedHandler at: 'files' ]