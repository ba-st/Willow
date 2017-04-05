utility
fullDocumentRendering: aWillowApplication

	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | aWillowApplication updateRoot: root ];
		render: [ :canvas | canvas render: aWillowApplication ]