baselines
setUpDependencies: spec

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/SeasideSt:v3.2.2/repository';
				loads: #('Development Tests' 'JQuery' 'Zinc') ];
		import: 'Seaside3'.

	spec
		baseline: 'RenoirSt'
			with: [ spec
				repository: 'github://ba-st/RenoirSt:master/source';
				loads: #('Deployment-Seaside-Extensions') ];
		import: 'RenoirSt'