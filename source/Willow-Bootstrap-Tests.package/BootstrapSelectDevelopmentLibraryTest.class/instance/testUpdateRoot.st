tests
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | BootstrapSelectDevelopmentLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/bootstrap-select/css/bootstrap-select.css"/><script type="text/javascript" src="/files/bootstrap-select/js/bootstrap-select.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'