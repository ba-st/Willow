baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'ObjectHolding-Model';
				package: 'ObjectHolding-Model-Tests' with: [ spec requires: 'ObjectHolding-Model' ];
				package: 'Willow' with: [ spec requires: 'ObjectHolding-Model' ];
				package: 'Willow-Tests' with: [ spec requires: 'Willow' ].
			spec
				group: 'Deployment' with: #('ObjectHolding-Model' 'Willow');
				group: 'Development' with: #('Deployment' 'ObjectHolding-Model-Tests' 'Willow-Tests');
				group: 'default' with: #('Deployment') ]