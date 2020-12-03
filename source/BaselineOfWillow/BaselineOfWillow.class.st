"
Metacello Baseline definition for Willow
"
Class {
	#name : #BaselineOfWillow,
	#superclass : #BaselineOf,
	#category : #BaselineOfWillow
}

{ #category : #baselines }
BaselineOfWillow >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				setUpPackages: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Tools' with: #('Boardwalk-Tools' 'Willow-Core-Development-Support');
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #accessing }
BaselineOfWillow >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfWillow >> setUpDependencies: spec [

	spec
		baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.x/repository' ];
		project: 'Seaside3-JQuery'
			copyFrom: 'Seaside3'
			with: [ spec loads: #('Core' 'Javascript' 'JQuery') ];
		project: 'Seaside3-Development' copyFrom: 'Seaside3' with: [ spec loads: #('Development') ].

	spec
		baseline: 'RenoirSt' with: [ spec repository: 'github://ba-st/RenoirSt:v7/source' ];
		project: 'RenoirSt-Deployment'
			copyFrom: 'RenoirSt'
			with: [ spec loads: 'Deployment-Seaside-Extensions' ].

	spec
		baseline: 'Boardwalk' with: [ spec repository: 'github://ba-st/Boardwalk:v5/source' ];
		project: 'Boardwalk-Deployment' copyFrom: 'Boardwalk' with: [ spec loads: 'Deployment' ];
		project: 'Boardwalk-SUnit'
			copyFrom: 'Boardwalk'
			with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Boardwalk-Tools' copyFrom: 'Boardwalk' with: [ spec loads: 'Tools' ]
]

{ #category : #baselines }
BaselineOfWillow >> setUpPackages: spec [

	spec
		package: 'Willow-Core'
			with: [ spec requires: #('Boardwalk-Deployment' 'Seaside3-JQuery' 'RenoirSt-Deployment') ];
		group: 'Deployment' with: 'Willow-Core';
		package: 'Willow-SUnit' with: [ spec requires: #('Boardwalk-SUnit' 'Willow-Core') ];
		group: 'Dependent-SUnit-Extensions' with: 'Willow-SUnit';
		package: 'Willow-Core-Tests' with: [ spec requires: 'Willow-SUnit' ];
		package: 'Willow-Core-Development-Support' with: [ spec requires: 'Seaside3-Development' ];
		group: 'Tests' with: #('Willow-Core-Tests' 'Willow-Core-Development-Support')
]
