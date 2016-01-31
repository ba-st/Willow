baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do:
			[ spec
				package: 'ObjectHolding-Model';
				package: 'Willow' with: [ spec requires: 'ObjectHolding-Model' ].
			spec
				group: 'Deployment' with: #('ObjectHolding-Model' 'Willow');
				group: 'Development' with: #('Deployment');
				group: 'default' with: #('Deployment') ]