baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'ObjectHolding-Model';
				package: 'ObjectHolding-Model-Tests' with: [ spec requires: 'ObjectHolding-Model' ].
			spec
				package: 'Willow' with: [ spec requires: #('ObjectHolding-Model' 'Seaside3' 'RenoirSt') ];
				package: 'Willow-Tests' with: [ spec requires: 'Willow' ];
				package: 'Willow-JQueryUI' with: [ spec requires: 'Willow' ];
				package: 'Willow-JQueryUI-Tests' with: [ spec requires: 'Willow-JQueryUI' ];
				package: 'Willow-SemanticUI' with: [ spec requires: 'Willow' ].
			spec
				group: 'Deployment' with: #('ObjectHolding-Model' 'Willow' 'Willow-JQueryUI' 'Willow-SemanticUI');
				group: 'Development' with: #('Deployment' 'ObjectHolding-Model-Tests' 'Willow-Tests' 'Willow-JQueryUI-Tests');
				group: 'default' with: #('Deployment') ]