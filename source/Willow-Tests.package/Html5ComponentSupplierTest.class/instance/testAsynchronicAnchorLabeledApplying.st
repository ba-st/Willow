tests-Supplying
testAsynchronicAnchorLabeledApplying

	self assertRenderingOf: [ :supplier | supplier asynchronicAnchorLabeled: 'Buy' applying: [ :anchor | anchor addClass willow ] ] equals: '<a id="a-id1" class="willow">Buy</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'