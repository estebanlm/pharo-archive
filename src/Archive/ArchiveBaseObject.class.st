Class {
	#name : 'ArchiveBaseObject',
	#superclass : 'FFIOpaqueObject',
	#traits : 'LibTArchive',
	#classTraits : 'LibTArchive classTrait',
	#pools : [
		'ArchiveTypedef'
	],
	#category : 'Archive-Base',
	#package : 'Archive',
	#tag : 'Base'
}

{ #category : 'finalization' }
ArchiveBaseObject >> autoRelease [
	
	FinalizationRegistry default add: self
]

{ #category : 'finalization' }
ArchiveBaseObject >> dispose [
	
	self subclassResponsibility
]

{ #category : 'finalization' }
ArchiveBaseObject >> finalize [
	
	self dispose.
	handle beNull
]

{ #category : 'initialization' }
ArchiveBaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
