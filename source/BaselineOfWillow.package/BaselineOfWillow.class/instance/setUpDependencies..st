baselines
setUpDependencies: spec

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('Development' 'JQuery' 'Zinc') ];
		project: 'Seaside3-Tests' copyFrom: 'Seaside3' with: [ spec loads: #('Tests') ];
		import: 'Seaside3'.

	spec
		baseline: 'RenoirSt'
			with: [ spec
				repository: 'github://ba-st/RenoirSt:master/source';
				loads: #('Deployment-Seaside-Extensions') ];
		import: 'RenoirSt'