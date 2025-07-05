Class {
	#name : 'BaselineOfArchive',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfArchive',
	#package : 'BaselineOfArchive'
}

{ #category : 'baselines' }
BaselineOfArchive >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		spec package: 'Archive' ]
]
