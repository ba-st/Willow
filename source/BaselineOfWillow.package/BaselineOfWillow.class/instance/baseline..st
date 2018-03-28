baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow' with: [ spec requires: #('Seaside3' 'RenoirSt' 'Boardwalk') ];
				package: 'Willow-Tests' with: [ spec requires: #('Seaside3-Tests' 'Boardwalk-Tests' 'Willow') ].
			spec
				group: 'Deployment' with: #('Willow');
				group: 'Development' with: #('Deployment' 'Willow-Tests');
				group: 'default' with: #('Deployment') ]