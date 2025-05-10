Class {
	#name : 'RFCell',
	#superclass : 'CMSpatialEntityElement',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'as yet unclassified' }
RFCell >> getMineral [
	self hasMineral ifFalse: [ self error: 'There is no mineral on this cell' ].
	^ (self occupantsOfClass: RFMineral ) first
]

{ #category : 'testing' }
RFCell >> hasMineral [
	^ self hasOccupantsOfClass: RFMineral
]
