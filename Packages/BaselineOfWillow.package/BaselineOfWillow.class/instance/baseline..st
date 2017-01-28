baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.

			spec
				package: 'Willow' with: [ spec requires: #('Seaside3' 'RenoirSt') ];
				package: 'Willow-Tests' with: [ spec requires: 'Willow' ];
				package: 'Willow-JQueryUI' with: [ spec requires: 'Willow' ];
				package: 'Willow-JQueryUI-Tests' with: [ spec requires: 'Willow-JQueryUI' ];
				package: 'Willow-SemanticUI' with: [ spec requires: 'Willow' ].
			spec
				group: 'Deployment' with: #('Willow' 'Willow-JQueryUI' 'Willow-SemanticUI');
				group: 'Development' with: #('Deployment' 'Willow-Tests' 'Willow-JQueryUI-Tests');
				group: 'default' with: #('Deployment') ]