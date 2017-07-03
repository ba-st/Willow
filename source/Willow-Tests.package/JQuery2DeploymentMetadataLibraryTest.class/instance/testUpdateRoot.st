tests
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQuery2DeploymentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-2.2.4/jquery-2.2.4.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'