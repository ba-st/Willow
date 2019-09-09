"
Metacello Baseline definition for Willow
"
Class {
	#name : #BaselineOfWillow,
	#superclass : #BaselineOf,
	#category : 'BaselineOfWillow'
}

{ #category : #baselines }
BaselineOfWillow >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				baselineWillow: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Tools' with: 'Boardwalk-Tools';
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #baselines }
BaselineOfWillow >> baselineWillow: spec [

	spec
		package: 'Willow'
			with: [ spec requires: #( 'Boardwalk-Deployment' 'Seaside3-JQuery' 'RenoirSt-Deployment') ];
		group: 'Deployment' with: 'Willow';
		package: 'Willow-SUnit' with: [ spec requires: #('Boardwalk-SUnit' 'Willow') ];
		group: 'Dependent-SUnit-Extensions' with: 'Willow-SUnit';
		package: 'Willow-Tests' with: [ spec requires: 'Willow-SUnit' ];
		group: 'Tests' with: 'Willow-Tests'
]

{ #category : #accessing }
BaselineOfWillow >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfWillow >> setUpDependencies: spec [

	spec
		baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.3.x/repository' ];
		project: 'Seaside3-JQuery' copyFrom: 'Seaside3' with: [ spec loads: #('Core' 'Javascript' 'JQuery') ].

	spec
		baseline: 'RenoirSt' with: [ spec repository: 'github://ba-st/RenoirSt:v6/source' ];
		project: 'RenoirSt-Deployment'
			copyFrom: 'RenoirSt'
			with: [ spec loads: 'Deployment-Seaside-Extensions' ].

	spec
		baseline: 'Boardwalk' with: [ spec repository: 'github://ba-st/Boardwalk:v4/source' ];
		project: 'Boardwalk-Deployment' copyFrom: 'Boardwalk' with: [ spec loads: 'Deployment' ];
		project: 'Boardwalk-SUnit'
			copyFrom: 'Boardwalk'
			with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Boardwalk-Tools' copyFrom: 'Boardwalk' with: [ spec loads: 'Tools' ]
]
