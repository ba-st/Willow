baselines
setUpDependencies: spec

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('Seaside-Environment' 'JQuery' 'Zinc') ];
		project: 'Seaside3-Tests' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Tests-Core') ].

	spec
		baseline: 'RenoirSt'
		with: [ spec
				repository: 'github://ba-st/RenoirSt:v5/source';
				loads: #('Deployment-Seaside-Extensions') ].

	spec
		baseline: 'Boardwalk'
			with: [ spec
				repository: 'github://ba-st/Boardwalk:v2/source';
				loads: #('Deployment') ];
		project: 'Boardwalk-Tests' copyFrom: 'Boardwalk' with: [ spec loads: #('Development') ]
