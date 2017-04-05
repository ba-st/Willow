utility
renderWholeApplication: application

	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | application updateRoot: root ];
		render: [ :canvas | canvas render: application ]