baselines
setUpDependencies: spec

	| repoLocation |

	repoLocation := 'github://SeasideSt/Seaside:v3.2.4/repository'.
	spec
		baseline: 'Seaside3'
		with: [ spec
				repository: repoLocation;
				loads: #('Seaside-Environment' 'JQuery' 'Zinc') ].
	spec
		project: 'Seaside3-Tests';
		baseline: 'Seaside3'
			with: [ spec
				repository: repoLocation;
				loads: #('Seaside-Tests-Core') ].

	spec
		baseline: 'RenoirSt'
		with: [ spec
				repository: 'github://ba-st/RenoirSt:master/source';
				loads: #('Deployment-Seaside-Extensions') ]