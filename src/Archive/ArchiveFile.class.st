Class {
	#name : 'ArchiveFile',
	#superclass : 'ArchiveBaseObject',
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalizing' }
ArchiveFile >> dispose [

	self ffiCall: #(void archive_dispose(archive* self))
]
