tests-Processing
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | Html5ComponentSupplier new updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'