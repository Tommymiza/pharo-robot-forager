Class {
	#name : 'RFModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'robots',
		'minerals'
	],
	#classInstVars : [
		'numberOfRows',
		'numberOfColumns',
		'numberOfRobots',
		'numberOfMinerals'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'as yet unclassified' }
RFModel class >> aboutThisModel [

	^ ''
]

{ #category : 'initialization' }
RFModel class >> initializeParameters [ 
	super initializeParameters.
	numberOfRows := 5.
	numberOfColumns := 5.
	numberOfRobots := 2.
	numberOfMinerals := 15
]

{ #category : 'accessing' }
RFModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
RFModel class >> numberOfColumns: anInteger [

	numberOfColumns := anInteger
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals [

	^ numberOfMinerals
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals: anInteger [

	numberOfMinerals := anInteger
]

{ #category : 'accessing' }
RFModel class >> numberOfRobots [

	^ numberOfRobots
]

{ #category : 'accessing' }
RFModel class >> numberOfRobots: anInteger [

	numberOfRobots := anInteger
]

{ #category : 'accessing' }
RFModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
RFModel class >> numberOfRows: anInteger [

	numberOfRows := anInteger
]

{ #category : 'as yet unclassified' }
RFModel class >> prefix [

	^ 'RF'
]

{ #category : 'accessing - entities' }
RFModel >> cells [
	<getterFor: #RFCell>
	^ cells
]

{ #category : 'as yet unclassified' }
RFModel >> init [
	<init>
	self
		createGridNumberOfRows: self class numberOfRows numberOfColumns: self class numberOfColumns neighbourhood: 8 closed: true.
	self createN: self class numberOfRobots randomlyLocatedEntities: RFRobot.
	self createN: self class numberOfMinerals randomlyLocatedAloneEntities: RFMineral
]

{ #category : 'as yet unclassified' }
RFModel >> initLarge [
	<init>
	self
		createGridNumberOfRows: 30 numberOfColumns: 40 neighbourhood: 8 closed: true.
	self createN: 2 randomlyLocatedEntities: RFRobot.
	self createN: 100 randomlyLocatedAloneEntities: RFMineral
]

{ #category : 'as yet unclassified' }
RFModel >> initSmall [
	<init>
	self
		createGridNumberOfRows: 5 numberOfColumns: 5 neighbourhood: 8 closed: true.
	self createN: 2 randomlyLocatedEntities: RFRobot.
	self createN: 15 randomlyLocatedAloneEntities: RFMineral
]

{ #category : 'intialization' }
RFModel >> initialize [
	super initialize.
	cells := OrderedCollection new.
	robots := OrderedCollection new.
	minerals := OrderedCollection new.
]

{ #category : 'accessing' }
RFModel >> minerals [
	<getterFor: #RFMineral>
	^ minerals
]

{ #category : 'as yet unclassified' }
RFModel >> numberOfCollectedMinerals [
	<probeNamed: 'Collected minerals' color: 'FCBA03'>
	^ robots sum: [ :robot | robot collectedMinerals size ]
]

{ #category : 'as yet unclassified' }
RFModel >> numberOfRemainingMinerals [
	<probeNamed: 'Remaining minerals' color: 'E33030'>
	^ minerals count: [ :mineral | mineral patch isNotNil ]
]

{ #category : 'as yet unclassified' }
RFModel >> numberOfStep [
	"do nothing"
]

{ #category : 'accessing' }
RFModel >> robots [
	<getterFor: #RFRobot>
	^ robots
]

{ #category : 'stepping' }
RFModel >> step [
	<control>
	robots do: [ :robot | robot step ]
]
