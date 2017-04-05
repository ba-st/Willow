tests
testRenderContentOn

	| html application |

	application := WillowTestingApplication new.
	html := self fullDocumentRendering: application.

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title>The official testing app</title><script type="text/javascript" src="/files/JQ2DevelopmentLibrary/jQuery.js"></script></head><body onload="onLoad()"><span><select name="1"></select></span><div id="willow-dialog-section" class="willow-dialog-container"></div><div class="willow-notification-section"></div><script type="text/javascript">function onLoad(){};</script></body></html>'