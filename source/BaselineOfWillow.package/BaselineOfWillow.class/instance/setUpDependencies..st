baselines
setUpDependencies: spec

	spec
		configuration: 'Seaside3'
		with: [ spec
				version: #'release3.2';
				repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
				loads: #('Seaside-Development' 'Seaside-Pharo-Environment' 'Zinc-Seaside' 'Javascript-Pharo20-Core' 'JQuery-JSON' 'JQuery-UI') ].

	spec
		baseline: 'RenoirSt'
			with: [ spec
				repository: 'github://ba-st/RenoirSt:master/source';
				loads: #('Deployment-Seaside-Extensions') ];
		import: 'RenoirSt'