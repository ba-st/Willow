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
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow' with: [ spec requires: #('Seaside3' 'RenoirSt' 'Boardwalk') ];
				package: 'Willow-Tests' with: [ spec requires: #('Seaside3-Tests' 'Boardwalk-Tests' 'Willow') ].
			spec
				group: 'Deployment' with: #('Willow');
				group: 'Development' with: #('Deployment' 'Willow-Tests');
				group: 'default' with: #('Deployment') ]
]

{ #category : #baselines }
BaselineOfWillow >> setUpDependencies: spec [

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('Seaside-Environment' 'JQuery' 'Zinc') ];
		project: 'Seaside3-Tests' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Tests-Core') ].

	spec
		baseline: 'RenoirSt'
		with: [ spec
				repository: 'github://ba-st/RenoirSt:v6/source';
				loads: #('Deployment-Seaside-Extensions') ].

	spec
		baseline: 'Boardwalk'
			with: [ spec
				repository: 'github://ba-st/Boardwalk:v2/source';
				loads: #('Deployment') ];
		project: 'Boardwalk-Tests' copyFrom: 'Boardwalk' with: [ spec loads: #('Development') ]

]
