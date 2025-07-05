Class {
	#name : 'ArchiveStat',
	#superclass : 'ArchiveBaseObject',
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalizing' }
ArchiveStat >> dispose [

	self ffiCall: #(void stat_dispose(stat* self))
]
