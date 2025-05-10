Class {
	#name : 'RFRobot',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'collectedMinerals'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'accessing' }
RFRobot >> collectMineral [
	<action>
	| mineral |
	self patch hasMineral ifFalse: [ ^ self ].
	mineral := self patch getMineral.
	collectedMinerals add: mineral.
	mineral leave
]

{ #category : 'accessing' }
RFRobot >> collectedMinerals [
	^ collectedMinerals
]

{ #category : 'initialization' }
RFRobot >> initialize [ 
	super initialize.
	collectedMinerals := OrderedCollection new.
]

{ #category : 'accessing' }
RFRobot >> move [
	<action>
	self patch neighbourhood detect: [ :cell | cell hasMineral ] ifFound: [ :cell | self moveTo: cell ] ifNone: [ self moveRandomly ]
]

{ #category : 'as yet unclassified' }
RFRobot >> moveRandomly [
	<action>
	self randomWalkConstrainedBy: [ :cell | (cell hasOccupantsOfClass: RFRobot) not ]
]

{ #category : 'accessing' }
RFRobot >> pov [
	<pov>
	^ CMPointOfView color: CMColor blue shape: #star size: 0.6
]

{ #category : 'control' }
RFRobot >> step [
	<action>
	self move.
	self collectMineral
]
