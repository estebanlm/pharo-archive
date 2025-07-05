Class {
	#name : 'ArchiveEntryLinkresolver',
	#superclass : 'ArchiveBaseObject',
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalizing' }
ArchiveEntryLinkresolver >> dispose [

	self ffiCall: #(void archive_entry_linkresolver_dispose(archive_entry_linkresolver* self))
]
