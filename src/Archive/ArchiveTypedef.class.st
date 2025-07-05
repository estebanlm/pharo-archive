Class {
	#name : 'ArchiveTypedef',
	#superclass : 'SharedPool',
	#classVars : [
		'__float128',
		'archive',
		'archive_acl',
		'archive_close_callback',
		'archive_entry',
		'archive_entry_linkresolver',
		'archive_free_callback',
		'archive_open_callback',
		'archive_passphrase_callback',
		'archive_read_callback',
		'archive_seek_callback',
		'archive_skip_callback',
		'archive_switch_callback',
		'archive_write_callback',
		'bool',
		'dev_t',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'la_int64_t',
		'la_ssize_t',
		'la_uint64_t',
		'mode_t',
		'pid_t',
		'ssize_t',
		'stat',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uintptr_t'
	],
	#category : 'Archive-Library',
	#package : 'Archive',
	#tag : 'Library'
}

{ #category : 'class initialization' }
ArchiveTypedef class >> initialize [

	uint16_t := #uint16.
	uint64_t := #uint64.
	uint8_t := #uint8.
	int32_t := #int32.
	uint32_t := #uint32.
	time_t := #int.
	pid_t := #int.
	__float128 := #float128.
	int8_t := #int8.
	int16_t := #int16.
	int64_t := #int64.
	bool := #Boolean.
	uintptr_t := #'void *'.
	ssize_t := #size_t.
	dev_t := #ulong.
	mode_t := #int.
	la_int64_t := #int64_t.
	la_uint64_t := #uint64_t.
	la_ssize_t := ssize_t.
	archive := ArchiveFile.
	archive_entry := ArchiveEntry.
	stat := ArchiveStat.
	archive_acl := ArchiveAcl.
	archive_entry_linkresolver := ArchiveEntryLinkresolver.
	archive_read_callback := #void.
	archive_skip_callback := #void.
	archive_seek_callback := #void.
	archive_write_callback := #void.
	archive_open_callback := #void.
	archive_close_callback := #void.
	archive_free_callback := #void.
	archive_switch_callback := #void.
	archive_passphrase_callback := #void
]
