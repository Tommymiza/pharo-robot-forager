Class {
	#name : 'RFMineral',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'accessing' }
RFMineral >> pov [
	<pov>
	^ CMPointOfView color: CMColor gold shape: #diamond
]
