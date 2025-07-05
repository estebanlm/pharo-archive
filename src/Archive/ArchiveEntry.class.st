Class {
	#name : 'ArchiveEntry',
	#superclass : 'ArchiveBaseObject',
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalizing' }
ArchiveEntry >> dispose [

	self ffiCall: #(void archive_entry_dispose(archive_entry* self))
]
