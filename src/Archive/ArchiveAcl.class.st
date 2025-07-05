Class {
	#name : 'ArchiveAcl',
	#superclass : 'ArchiveBaseObject',
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalizing' }
ArchiveAcl >> dispose [

	self ffiCall: #(void archive_acl_dispose(archive_acl* self))
]
