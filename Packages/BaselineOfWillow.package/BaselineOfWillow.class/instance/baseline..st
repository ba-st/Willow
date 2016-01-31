baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ spec
				package: 'ObjectHolding-Model';
				package: 'Willow' with: [ spec requires: 'ObjectHolding-Model' ] ]