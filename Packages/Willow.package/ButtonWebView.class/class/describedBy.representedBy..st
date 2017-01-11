instance creation
describedBy: aDescription representedBy: anIcon

	self
		deprecated: 'User AsynchronicButtonWebView'
		transformWith:
			'ButtonWebView describedBy: `@aDescription representedBy: `@anIcon'
				->
					'AsynchronicButtonWebView
		labeled: `@aDescription
		applying:
			(ComponentScriptCommand
				toExecute: [ :canvas | 
					canvas jQuery this button
						text: false;
						primaryIcon: `@anIcon ])'.

	^ AsynchronicButtonWebView
		labeled: aDescription
		applying:
			(ComponentScriptCommand
				toExecute: [ :canvas | 
					canvas jQuery this button
						text: false;
						primaryIcon: anIcon ])