"
Bindings for [libarchive](https://www.libarchive.org/).

Generated with:
```smalltalk
CigCLibraryGenerator new
	packageName: 'Archive';
	prefix: 'Archive';
	libraryName: 'archive';
	import: 'archive.h';
	import: 'archive_entry.h';
	cExcludePath: '/usr/include';
	nameGenerator: (CigNameGenerator new 
		withoutPrefixInFunctionName;
		rename: 'Archive' as: 'ArchiveFile';
		yourself);
	constantGenerator: (CigConstantGenerator new 
		excludeMacro: '__LA_DEPRECATED';
		yourself);
	cTypedef: #ssize_t as: #size_t;
	cTypedef: #dev_t as: #ulong;
	cTypedef: #mode_t as: #int;
	generate.
```
"
Class {
	#name : 'LibArchive',
	#superclass : 'FFILibrary',
	#pools : [
		'ArchiveConstants',
		'ArchiveTypedef'
	],
	#category : 'Archive-Library',
	#package : 'Archive',
	#tag : 'Library'
}

{ #category : 'examples' }
LibArchive class >> example [
	<example>

	^ self example: './40164.zip'
]

{ #category : 'examples' }
LibArchive class >> example: aFilenameOrReference [
	"list contents of a file"
	| fileRef arc archive paths entryHolder entry |

	arc := LibArchive uniqueInstance.
	
	fileRef := aFilenameOrReference asFileReference.
	fileRef exists 
		ifFalse: [ self error: 'File ', fileRef fullName, ' not found.' ]. 

	archive := arc read_new.
	arc read_support_filter_all: archive.
	arc read_support_format_all: archive.
	arc 
		read_open_filenameArg1: archive 
		_filename: fileRef fullName 
		_block_size: 10240.

	paths := OrderedCollection new.
	entryHolder := ArchiveEntry newValueHolder.
	[ (arc read_next_headerArg1: archive arg2: entryHolder) = ARCHIVE_OK ] 
	whileTrue: [ 
		entry := entryHolder value.
		paths add: (arc entry_pathname: entry). 
		arc read_data_skip: archive.
	].

	arc read_free: archive.

	^ paths
]

{ #category : 'public - archive' }
LibArchive >> bzlib_version [

	^ self ffiCall: #(const char* archive_bzlib_version())
]

{ #category : 'public - archive' }
LibArchive >> clear_error: arg1 [

	self ffiCall: #(void archive_clear_error(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> cng_version [

	^ self ffiCall: #(const char* archive_cng_version())
]

{ #category : 'public - archive' }
LibArchive >> commoncrypto_version [

	^ self ffiCall: #(const char* archive_commoncrypto_version())
]

{ #category : 'public - archive' }
LibArchive >> compression: arg1 [

	^ self ffiCall: #(int archive_compression(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> compression_name: arg1 [

	^ self ffiCall: #(const char* archive_compression_name(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> copy_errorDest: dest src: src [

	self ffiCall: #(void archive_copy_error(archive* dest, archive* src))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl: arg1 [

	^ self ffiCall: #(archive_acl* archive_entry_acl(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_add_entryArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 arg5: arg5 arg6: arg6 [

	^ self ffiCall: #(int archive_entry_acl_add_entry(archive_entry* arg1, int arg2, int arg3, int arg4, int arg5, const char* arg6))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_add_entry_wArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 arg5: arg5 arg6: arg6 [

	^ self ffiCall: #(int archive_entry_acl_add_entry_w(archive_entry* arg1, int arg2, int arg3, int arg4, int arg5, const int* arg6))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_clear: arg1 [

	self ffiCall: #(void archive_entry_acl_clear(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_countArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_acl_count(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_from_textArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_entry_acl_from_text(archive_entry* arg1, const char* arg2, int arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_from_text_wArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_entry_acl_from_text_w(archive_entry* arg1, const int* arg2, int arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_nextArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 arg5: arg5 arg6: arg6 arg7: arg7 [

	^ self ffiCall: #(int archive_entry_acl_next(archive_entry* arg1, int arg2, int* arg3, int* arg4, int* arg5, int* arg6, const char** arg7))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_resetArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_acl_reset(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_textArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const char* archive_entry_acl_text(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_text_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const int* archive_entry_acl_text_w(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_to_textArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(char* archive_entry_acl_to_text(archive_entry* arg1, la_ssize_t* arg2, int arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_to_text_wArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int* archive_entry_acl_to_text_w(archive_entry* arg1, la_ssize_t* arg2, int arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_acl_types: arg1 [

	^ self ffiCall: #(int archive_entry_acl_types(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_atime: arg1 [

	^ self ffiCall: #(time_t archive_entry_atime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_atime_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_atime_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_atime_nsec: arg1 [

	^ self ffiCall: #(long archive_entry_atime_nsec(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_birthtime: arg1 [

	^ self ffiCall: #(time_t archive_entry_birthtime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_birthtime_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_birthtime_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_birthtime_nsec: arg1 [

	^ self ffiCall: #(long archive_entry_birthtime_nsec(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_clear: arg1 [

	^ self ffiCall: #(archive_entry* archive_entry_clear(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_clone: arg1 [

	^ self ffiCall: #(archive_entry* archive_entry_clone(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_fflags_textArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const char* archive_entry_copy_fflags_text(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_fflags_text_lenArg1: arg1 arg2: arg2 size_t: size_t [

	^ self ffiCall: #(const char* archive_entry_copy_fflags_text_len(archive_entry* arg1, const char* arg2, size_t size_t))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_fflags_text_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const int* archive_entry_copy_fflags_text_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_gnameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_gname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_gname_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_gname_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_hardlinkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_hardlink(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_hardlink_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_hardlink_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_linkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_link(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_link_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_link_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_mac_metadataArg1: arg1 arg2: arg2 size_t: size_t [

	self ffiCall: #(void archive_entry_copy_mac_metadata(archive_entry* arg1, const void* arg2, size_t size_t))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_pathnameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_pathname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_pathname_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_pathname_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_sourcepathArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_sourcepath(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_sourcepath_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_sourcepath_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_statArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_stat(archive_entry* arg1, stat* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_symlinkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_symlink(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_symlink_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_symlink_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_unameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_uname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_copy_uname_wArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_copy_uname_w(archive_entry* arg1, const int* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ctime: arg1 [

	^ self ffiCall: #(time_t archive_entry_ctime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ctime_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_ctime_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ctime_nsec: arg1 [

	^ self ffiCall: #(long archive_entry_ctime_nsec(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_dev: arg1 [

	^ self ffiCall: #(dev_t archive_entry_dev(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_dev_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_dev_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_devmajor: arg1 [

	^ self ffiCall: #(dev_t archive_entry_devmajor(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_devminor: arg1 [

	^ self ffiCall: #(dev_t archive_entry_devminor(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_digestArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const uchar* archive_entry_digest(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_fflagsArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_fflags(archive_entry* arg1, ulong* arg2, ulong* arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_fflags_text: arg1 [

	^ self ffiCall: #(const char* archive_entry_fflags_text(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_filetype: arg1 [

	^ self ffiCall: #(mode_t archive_entry_filetype(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_filetype_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_filetype_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_free: arg1 [

	self ffiCall: #(void archive_entry_free(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_gid: arg1 [

	^ self ffiCall: #(la_int64_t archive_entry_gid(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_gid_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_gid_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_gname: arg1 [

	^ self ffiCall: #(const char* archive_entry_gname(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_gname_utf8: arg1 [

	^ self ffiCall: #(const char* archive_entry_gname_utf8(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_gname_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_gname_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_hardlink: arg1 [

	^ self ffiCall: #(const char* archive_entry_hardlink(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_hardlink_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_hardlink_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_hardlink_utf8: arg1 [

	^ self ffiCall: #(const char* archive_entry_hardlink_utf8(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_hardlink_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_hardlink_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ino64: arg1 [

	^ self ffiCall: #(la_int64_t archive_entry_ino64(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ino: arg1 [

	^ self ffiCall: #(la_int64_t archive_entry_ino(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_ino_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_ino_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_is_data_encrypted: arg1 [

	^ self ffiCall: #(int archive_entry_is_data_encrypted(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_is_encrypted: arg1 [

	^ self ffiCall: #(int archive_entry_is_encrypted(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_is_metadata_encrypted: arg1 [

	^ self ffiCall: #(int archive_entry_is_metadata_encrypted(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_linkifyArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_linkify(archive_entry_linkresolver* arg1, archive_entry* arg2, archive_entry* arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_linkresolver_free: arg1 [

	self ffiCall: #(void archive_entry_linkresolver_free(archive_entry_linkresolver* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_linkresolver_new [

	^ self ffiCall: #(archive_entry_linkresolver* archive_entry_linkresolver_new())
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_linkresolver_set_strategyArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_linkresolver_set_strategy(archive_entry_linkresolver* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_mac_metadataArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const void* archive_entry_mac_metadata(archive_entry* arg1, size_t* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_mode: arg1 [

	^ self ffiCall: #(mode_t archive_entry_mode(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_mtime: arg1 [

	^ self ffiCall: #(time_t archive_entry_mtime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_mtime_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_mtime_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_mtime_nsec: arg1 [

	^ self ffiCall: #(long archive_entry_mtime_nsec(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_new [

	^ self ffiCall: #(archive_entry* archive_entry_new())
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_new2: arg1 [

	^ self ffiCall: #(archive_entry* archive_entry_new2(archive* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_nlink: arg1 [

	^ self ffiCall: #(uint archive_entry_nlink(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_partial_linksRes: res links: links [

	^ self ffiCall: #(archive_entry* archive_entry_partial_links(archive_entry_linkresolver* res, uint* links))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_pathname: arg1 [

	^ self ffiCall: #(const char* archive_entry_pathname(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_pathname_utf8: arg1 [

	^ self ffiCall: #(const char* archive_entry_pathname_utf8(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_pathname_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_pathname_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_perm: arg1 [

	^ self ffiCall: #(mode_t archive_entry_perm(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_perm_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_perm_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_rdev: arg1 [

	^ self ffiCall: #(dev_t archive_entry_rdev(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_rdev_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_rdev_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_rdevmajor: arg1 [

	^ self ffiCall: #(dev_t archive_entry_rdevmajor(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_rdevminor: arg1 [

	^ self ffiCall: #(dev_t archive_entry_rdevminor(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_atimeArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_set_atime(archive_entry* arg1, time_t arg2, long arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_birthtimeArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_set_birthtime(archive_entry* arg1, time_t arg2, long arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_ctimeArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_set_ctime(archive_entry* arg1, time_t arg2, long arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_devArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_dev(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_devmajorArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_devmajor(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_devminorArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_devminor(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_digestArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_entry_set_digest(archive_entry* arg1, int arg2, const uchar* arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_fflagsArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_set_fflags(archive_entry* arg1, ulong arg2, ulong arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_filetypeArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_filetype(archive_entry* arg1, uint arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_gidArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_gid(archive_entry* arg1, la_int64_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_gnameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_gname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_gname_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_gname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_hardlinkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_hardlink(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_hardlink_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_hardlink_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_ino64Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_ino64(archive_entry* arg1, la_int64_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_inoArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_ino(archive_entry* arg1, la_int64_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_is_data_encryptedArg1: arg1 is_encrypted: is_encrypted [

	self ffiCall: #(void archive_entry_set_is_data_encrypted(archive_entry* arg1, char is_encrypted))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_is_metadata_encryptedArg1: arg1 is_encrypted: is_encrypted [

	self ffiCall: #(void archive_entry_set_is_metadata_encrypted(archive_entry* arg1, char is_encrypted))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_linkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_link(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_link_to_hardlink: arg1 [

	self ffiCall: #(void archive_entry_set_link_to_hardlink(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_link_to_symlink: arg1 [

	self ffiCall: #(void archive_entry_set_link_to_symlink(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_link_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_link_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_modeArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_mode(archive_entry* arg1, mode_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_mtimeArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_set_mtime(archive_entry* arg1, time_t arg2, long arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_nlinkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_nlink(archive_entry* arg1, uint arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_pathnameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_pathname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_pathname_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_pathname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_permArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_perm(archive_entry* arg1, mode_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_rdevArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_rdev(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_rdevmajorArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_rdevmajor(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_rdevminorArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_rdevminor(archive_entry* arg1, dev_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_sizeArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_size(archive_entry* arg1, la_int64_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_symlinkArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_symlink(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_symlink_typeArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_symlink_type(archive_entry* arg1, int arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_symlink_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_symlink_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_uidArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_uid(archive_entry* arg1, la_int64_t arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_unameArg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_uname(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_set_uname_utf8Arg1: arg1 arg2: arg2 [

	self ffiCall: #(void archive_entry_set_uname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_size: arg1 [

	^ self ffiCall: #(la_int64_t archive_entry_size(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_size_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_size_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sourcepath: arg1 [

	^ self ffiCall: #(const char* archive_entry_sourcepath(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sourcepath_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_sourcepath_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sparse_add_entryArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_entry_sparse_add_entry(archive_entry* arg1, la_int64_t arg2, la_int64_t arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sparse_clear: arg1 [

	self ffiCall: #(void archive_entry_sparse_clear(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sparse_count: arg1 [

	^ self ffiCall: #(int archive_entry_sparse_count(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sparse_nextArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_entry_sparse_next(archive_entry* arg1, la_int64_t* arg2, la_int64_t* arg3))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_sparse_reset: arg1 [

	^ self ffiCall: #(int archive_entry_sparse_reset(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_stat: arg1 [

	^ self ffiCall: #(stat* archive_entry_stat(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_strmode: arg1 [

	^ self ffiCall: #(const char* archive_entry_strmode(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_symlink: arg1 [

	^ self ffiCall: #(const char* archive_entry_symlink(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_symlink_type: arg1 [

	^ self ffiCall: #(int archive_entry_symlink_type(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_symlink_utf8: arg1 [

	^ self ffiCall: #(const char* archive_entry_symlink_utf8(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_symlink_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_symlink_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_uid: arg1 [

	^ self ffiCall: #(la_int64_t archive_entry_uid(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_uid_is_set: arg1 [

	^ self ffiCall: #(int archive_entry_uid_is_set(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_uname: arg1 [

	^ self ffiCall: #(const char* archive_entry_uname(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_uname_utf8: arg1 [

	^ self ffiCall: #(const char* archive_entry_uname_utf8(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_uname_w: arg1 [

	^ self ffiCall: #(const int* archive_entry_uname_w(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_unset_atime: arg1 [

	self ffiCall: #(void archive_entry_unset_atime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_unset_birthtime: arg1 [

	self ffiCall: #(void archive_entry_unset_birthtime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_unset_ctime: arg1 [

	self ffiCall: #(void archive_entry_unset_ctime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_unset_mtime: arg1 [

	self ffiCall: #(void archive_entry_unset_mtime(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_unset_size: arg1 [

	self ffiCall: #(void archive_entry_unset_size(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_gname_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_gname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_hardlink_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_hardlink_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_link_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_link_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_pathname_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_pathname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_symlink_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_symlink_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_update_uname_utf8Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_entry_update_uname_utf8(archive_entry* arg1, const char* arg2))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_xattr_add_entryArg1: arg1 arg2: arg2 arg3: arg3 size_t: size_t [

	self ffiCall: #(void archive_entry_xattr_add_entry(archive_entry* arg1, const char* arg2, const void* arg3, size_t size_t))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_xattr_clear: arg1 [

	self ffiCall: #(void archive_entry_xattr_clear(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_xattr_count: arg1 [

	^ self ffiCall: #(int archive_entry_xattr_count(archive_entry* arg1))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_xattr_nextArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_entry_xattr_next(archive_entry* arg1, const char** arg2, const void** arg3, size_t* arg4))
]

{ #category : 'public - archive_entry' }
LibArchive >> entry_xattr_reset: arg1 [

	^ self ffiCall: #(int archive_entry_xattr_reset(archive_entry* arg1))
]

{ #category : 'public - archive' }
LibArchive >> errno: arg1 [

	^ self ffiCall: #(int archive_errno(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> error_string: arg1 [

	^ self ffiCall: #(const char* archive_error_string(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> file_count: arg1 [

	^ self ffiCall: #(int archive_file_count(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> filter_bytesArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(la_int64_t archive_filter_bytes(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> filter_codeArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_filter_code(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> filter_count: arg1 [

	^ self ffiCall: #(int archive_filter_count(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> filter_nameArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const char* archive_filter_name(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> format: arg1 [

	^ self ffiCall: #(int archive_format(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> format_name: arg1 [

	^ self ffiCall: #(const char* archive_format_name(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> free: arg1 [

	^ self ffiCall: #(int archive_free(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> libacl_version [

	^ self ffiCall: #(const char* archive_libacl_version())
]

{ #category : 'public - archive' }
LibArchive >> libattr_version [

	^ self ffiCall: #(const char* archive_libattr_version())
]

{ #category : 'public - archive' }
LibArchive >> libbsdxml_version [

	^ self ffiCall: #(const char* archive_libbsdxml_version())
]

{ #category : 'public - archive' }
LibArchive >> libexpat_version [

	^ self ffiCall: #(const char* archive_libexpat_version())
]

{ #category : 'public - archive' }
LibArchive >> libiconv_version [

	^ self ffiCall: #(const char* archive_libiconv_version())
]

{ #category : 'public - archive' }
LibArchive >> liblz4_version [

	^ self ffiCall: #(const char* archive_liblz4_version())
]

{ #category : 'public - archive' }
LibArchive >> liblzma_version [

	^ self ffiCall: #(const char* archive_liblzma_version())
]

{ #category : 'public - archive' }
LibArchive >> liblzo2_version [

	^ self ffiCall: #(const char* archive_liblzo2_version())
]

{ #category : 'public - archive' }
LibArchive >> libmd_version [

	^ self ffiCall: #(const char* archive_libmd_version())
]

{ #category : 'public - archive' }
LibArchive >> libpcre2_version [

	^ self ffiCall: #(const char* archive_libpcre2_version())
]

{ #category : 'public - archive' }
LibArchive >> libpcre_version [

	^ self ffiCall: #(const char* archive_libpcre_version())
]

{ #category : 'public - archive' }
LibArchive >> librichacl_version [

	^ self ffiCall: #(const char* archive_librichacl_version())
]

{ #category : 'public - archive' }
LibArchive >> libxml2_version [

	^ self ffiCall: #(const char* archive_libxml2_version())
]

{ #category : 'public - archive' }
LibArchive >> libzstd_version [

	^ self ffiCall: #(const char* archive_libzstd_version())
]

{ #category : 'accessing - platform' }
LibArchive >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libarchive.dylib'
]

{ #category : 'public - archive' }
LibArchive >> match_exclude_entryArg1: arg1 _flag: _flag arg3: arg3 [

	^ self ffiCall: #(int archive_match_exclude_entry(archive* arg1, int _flag, archive_entry* arg3))
]

{ #category : 'public - archive' }
LibArchive >> match_exclude_patternArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_exclude_pattern(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_exclude_pattern_from_fileArg1: arg1 arg2: arg2 _nullSeparator: _nullSeparator [

	^ self ffiCall: #(int archive_match_exclude_pattern_from_file(archive* arg1, const char* arg2, int _nullSeparator))
]

{ #category : 'public - archive' }
LibArchive >> match_exclude_pattern_from_file_wArg1: arg1 arg2: arg2 _nullSeparator: _nullSeparator [

	^ self ffiCall: #(int archive_match_exclude_pattern_from_file_w(archive* arg1, const int* arg2, int _nullSeparator))
]

{ #category : 'public - archive' }
LibArchive >> match_exclude_pattern_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_exclude_pattern_w(archive* arg1, const int* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_excludedArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_excluded(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_free: arg1 [

	^ self ffiCall: #(int archive_match_free(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> match_include_dateArg1: arg1 _flag: _flag _datestr: _datestr [

	^ self ffiCall: #(int archive_match_include_date(archive* arg1, int _flag, const char* _datestr))
]

{ #category : 'public - archive' }
LibArchive >> match_include_date_wArg1: arg1 _flag: _flag _datestr: _datestr [

	^ self ffiCall: #(int archive_match_include_date_w(archive* arg1, int _flag, const int* _datestr))
]

{ #category : 'public - archive' }
LibArchive >> match_include_file_timeArg1: arg1 _flag: _flag _pathname: _pathname [

	^ self ffiCall: #(int archive_match_include_file_time(archive* arg1, int _flag, const char* _pathname))
]

{ #category : 'public - archive' }
LibArchive >> match_include_file_time_wArg1: arg1 _flag: _flag _pathname: _pathname [

	^ self ffiCall: #(int archive_match_include_file_time_w(archive* arg1, int _flag, const int* _pathname))
]

{ #category : 'public - archive' }
LibArchive >> match_include_gidArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_gid(archive* arg1, la_int64_t arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_gnameArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_gname(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_gname_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_gname_w(archive* arg1, const int* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_patternArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_pattern(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_pattern_from_fileArg1: arg1 arg2: arg2 _nullSeparator: _nullSeparator [

	^ self ffiCall: #(int archive_match_include_pattern_from_file(archive* arg1, const char* arg2, int _nullSeparator))
]

{ #category : 'public - archive' }
LibArchive >> match_include_pattern_from_file_wArg1: arg1 arg2: arg2 _nullSeparator: _nullSeparator [

	^ self ffiCall: #(int archive_match_include_pattern_from_file_w(archive* arg1, const int* arg2, int _nullSeparator))
]

{ #category : 'public - archive' }
LibArchive >> match_include_pattern_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_pattern_w(archive* arg1, const int* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_timeArg1: arg1 _flag: _flag _sec: _sec _nsec: _nsec [

	^ self ffiCall: #(int archive_match_include_time(archive* arg1, int _flag, time_t _sec, long _nsec))
]

{ #category : 'public - archive' }
LibArchive >> match_include_uidArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_uid(archive* arg1, la_int64_t arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_unameArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_uname(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_include_uname_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_include_uname_w(archive* arg1, const int* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_new [

	^ self ffiCall: #(archive* archive_match_new())
]

{ #category : 'public - archive' }
LibArchive >> match_owner_excludedArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_owner_excluded(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_path_excludedArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_path_excluded(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_path_unmatched_inclusions: arg1 [

	^ self ffiCall: #(int archive_match_path_unmatched_inclusions(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> match_path_unmatched_inclusions_nextArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_path_unmatched_inclusions_next(archive* arg1, const char** arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_path_unmatched_inclusions_next_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_path_unmatched_inclusions_next_w(archive* arg1, const int** arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_set_inclusion_recursionArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_set_inclusion_recursion(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> match_time_excludedArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_match_time_excluded(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> mbedtls_version [

	^ self ffiCall: #(const char* archive_mbedtls_version())
]

{ #category : 'public - archive' }
LibArchive >> nettle_version [

	^ self ffiCall: #(const char* archive_nettle_version())
]

{ #category : 'public - archive' }
LibArchive >> openssl_version [

	^ self ffiCall: #(const char* archive_openssl_version())
]

{ #category : 'public - archive' }
LibArchive >> parse_dateNow: now datestr: datestr [

	^ self ffiCall: #(time_t archive_parse_date(time_t now, const char* datestr))
]

{ #category : 'public - archive' }
LibArchive >> position_compressed: arg1 [

	^ self ffiCall: #(la_int64_t archive_position_compressed(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> position_uncompressed: arg1 [

	^ self ffiCall: #(la_int64_t archive_position_uncompressed(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_add_callback_dataArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_read_add_callback_data(archive* arg1, void* arg2, uint arg3))
]

{ #category : 'public - archive' }
LibArchive >> read_add_passphraseArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_add_passphrase(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_append_callback_dataArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_append_callback_data(archive* arg1, void* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_append_filterArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_append_filter(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_append_filter_programArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_append_filter_program(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_append_filter_program_signatureArg1: arg1 arg2: arg2 arg3: arg3 size_t: size_t [

	^ self ffiCall: #(int archive_read_append_filter_program_signature(archive* arg1, const char* arg2, const void* arg3, size_t size_t))
]

{ #category : 'public - archive' }
LibArchive >> read_close: arg1 [

	^ self ffiCall: #(int archive_read_close(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_dataArg1: arg1 arg2: arg2 size_t: size_t [

	^ self ffiCall: #(la_ssize_t archive_read_data(archive* arg1, void* arg2, size_t size_t))
]

{ #category : 'public - archive' }
LibArchive >> read_data_blockA: a buff: buff size: size offset: offset [

	^ self ffiCall: #(int archive_read_data_block(archive* a, const void** buff, size_t* size, la_int64_t* offset))
]

{ #category : 'public - archive' }
LibArchive >> read_data_into_fdArg1: arg1 fd: fd [

	^ self ffiCall: #(int archive_read_data_into_fd(archive* arg1, int fd))
]

{ #category : 'public - archive' }
LibArchive >> read_data_skip: arg1 [

	^ self ffiCall: #(int archive_read_data_skip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_can_descend: arg1 [

	^ self ffiCall: #(int archive_read_disk_can_descend(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_current_filesystem: arg1 [

	^ self ffiCall: #(int archive_read_disk_current_filesystem(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_current_filesystem_is_remote: arg1 [

	^ self ffiCall: #(int archive_read_disk_current_filesystem_is_remote(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_current_filesystem_is_synthetic: arg1 [

	^ self ffiCall: #(int archive_read_disk_current_filesystem_is_synthetic(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_descend: arg1 [

	^ self ffiCall: #(int archive_read_disk_descend(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_entry_from_fileArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_read_disk_entry_from_file(archive* arg1, archive_entry* arg2, int arg3, stat* arg4))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_gnameArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const char* archive_read_disk_gname(archive* arg1, la_int64_t arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_new [

	^ self ffiCall: #(archive* archive_read_disk_new())
]

{ #category : 'public - archive' }
LibArchive >> read_disk_openArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_disk_open(archive* arg1, const char* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_open_wArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_disk_open_w(archive* arg1, const int* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_atime_restored: arg1 [

	^ self ffiCall: #(int archive_read_disk_set_atime_restored(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_behaviorArg1: arg1 flags: flags [

	^ self ffiCall: #(int archive_read_disk_set_behavior(archive* arg1, int flags))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_gname_lookupArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_read_disk_set_gname_lookup(archive* arg1, void* arg2, void* arg3, void* arg4))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_matchingArg1: arg1 _matching: _matching _excluded_func: _excluded_func _client_data: _client_data [

	^ self ffiCall: #(int archive_read_disk_set_matching(archive* arg1, archive* _matching, void* _excluded_func, void* _client_data))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_metadata_filter_callbackArg1: arg1 _metadata_filter_func: _metadata_filter_func _client_data: _client_data [

	^ self ffiCall: #(int archive_read_disk_set_metadata_filter_callback(archive* arg1, void* _metadata_filter_func, void* _client_data))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_standard_lookup: arg1 [

	^ self ffiCall: #(int archive_read_disk_set_standard_lookup(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_symlink_hybrid: arg1 [

	^ self ffiCall: #(int archive_read_disk_set_symlink_hybrid(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_symlink_logical: arg1 [

	^ self ffiCall: #(int archive_read_disk_set_symlink_logical(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_symlink_physical: arg1 [

	^ self ffiCall: #(int archive_read_disk_set_symlink_physical(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_set_uname_lookupArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_read_disk_set_uname_lookup(archive* arg1, void* arg2, void* arg3, void* arg4))
]

{ #category : 'public - archive' }
LibArchive >> read_disk_unameArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(const char* archive_read_disk_uname(archive* arg1, la_int64_t arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_extract2Arg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_read_extract2(archive* arg1, archive_entry* arg2, archive* arg3))
]

{ #category : 'public - archive' }
LibArchive >> read_extractArg1: arg1 arg2: arg2 flags: flags [

	^ self ffiCall: #(int archive_read_extract(archive* arg1, archive_entry* arg2, int flags))
]

{ #category : 'public - archive' }
LibArchive >> read_extract_set_progress_callbackArg1: arg1 _progress_func: _progress_func _user_data: _user_data [

	self ffiCall: #(void archive_read_extract_set_progress_callback(archive* arg1, void* _progress_func, void* _user_data))
]

{ #category : 'public - archive' }
LibArchive >> read_extract_set_skip_fileArg1: arg1 arg2: arg2 arg3: arg3 [

	self ffiCall: #(void archive_read_extract_set_skip_file(archive* arg1, la_int64_t arg2, la_int64_t arg3))
]

{ #category : 'public - archive' }
LibArchive >> read_finish: arg1 [

	^ self ffiCall: #(int archive_read_finish(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_format_capabilities: arg1 [

	^ self ffiCall: #(int archive_read_format_capabilities(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_free: arg1 [

	^ self ffiCall: #(int archive_read_free(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_has_encrypted_entries: arg1 [

	^ self ffiCall: #(int archive_read_has_encrypted_entries(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_header_position: arg1 [

	^ self ffiCall: #(la_int64_t archive_read_header_position(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_new [

	^ self ffiCall: #(archive* archive_read_new())
]

{ #category : 'public - archive' }
LibArchive >> read_next_header2Arg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_next_header2(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_next_headerArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_next_header(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_open1: arg1 [

	^ self ffiCall: #(int archive_read_open1(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_open2Arg1: arg1 _client_data: _client_data arg3: arg3 arg4: arg4 arg5: arg5 arg6: arg6 [

	^ self ffiCall: #(int archive_read_open2(archive* arg1, void* _client_data, archive_open_callback* arg3, archive_read_callback* arg4, archive_skip_callback* arg5, archive_close_callback* arg6))
]

{ #category : 'public - archive' }
LibArchive >> read_openArg1: arg1 _client_data: _client_data arg3: arg3 arg4: arg4 arg5: arg5 [

	^ self ffiCall: #(int archive_read_open(archive* arg1, void* _client_data, archive_open_callback* arg3, archive_read_callback* arg4, archive_close_callback* arg5))
]

{ #category : 'public - archive' }
LibArchive >> read_open_FILEArg1: arg1 _file: _file [

	^ self ffiCall: #(int archive_read_open_FILE(archive* arg1, FILE* _file))
]

{ #category : 'public - archive' }
LibArchive >> read_open_fdArg1: arg1 _fd: _fd _block_size: _block_size [

	^ self ffiCall: #(int archive_read_open_fd(archive* arg1, int _fd, size_t _block_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_fileArg1: arg1 _filename: _filename _block_size: _block_size [

	^ self ffiCall: #(int archive_read_open_file(archive* arg1, const char* _filename, size_t _block_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_filenameArg1: arg1 _filename: _filename _block_size: _block_size [

	^ self ffiCall: #(int archive_read_open_filename(archive* arg1, const char* _filename, size_t _block_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_filename_wArg1: arg1 _filename: _filename _block_size: _block_size [

	^ self ffiCall: #(int archive_read_open_filename_w(archive* arg1, const int* _filename, size_t _block_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_filenamesArg1: arg1 _filenames: _filenames _block_size: _block_size [

	^ self ffiCall: #(int archive_read_open_filenames(archive* arg1, const char** _filenames, size_t _block_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_memory2A: a buff: buff size: size read_size: read_size [

	^ self ffiCall: #(int archive_read_open_memory2(archive* a, const void* buff, size_t size, size_t read_size))
]

{ #category : 'public - archive' }
LibArchive >> read_open_memoryArg1: arg1 buff: buff size: size [

	^ self ffiCall: #(int archive_read_open_memory(archive* arg1, const void* buff, size_t size))
]

{ #category : 'public - archive' }
LibArchive >> read_prepend_callback_dataArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_prepend_callback_data(archive* arg1, void* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_callback_data2Arg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_read_set_callback_data2(archive* arg1, void* arg2, uint arg3))
]

{ #category : 'public - archive' }
LibArchive >> read_set_callback_dataArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_callback_data(archive* arg1, void* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_close_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_close_callback(archive* arg1, archive_close_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_filter_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_read_set_filter_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> read_set_formatArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_format(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_format_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_read_set_format_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> read_set_open_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_open_callback(archive* arg1, archive_open_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_read_set_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> read_set_options_a: _a opts: opts [

	^ self ffiCall: #(int archive_read_set_options(archive* _a, const char* opts))
]

{ #category : 'public - archive' }
LibArchive >> read_set_passphrase_callbackArg1: arg1 client_data: client_data arg3: arg3 [

	^ self ffiCall: #(int archive_read_set_passphrase_callback(archive* arg1, void* client_data, archive_passphrase_callback* arg3))
]

{ #category : 'public - archive' }
LibArchive >> read_set_read_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_read_callback(archive* arg1, archive_read_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_seek_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_seek_callback(archive* arg1, archive_seek_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_skip_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_skip_callback(archive* arg1, archive_skip_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_set_switch_callbackArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_set_switch_callback(archive* arg1, archive_switch_callback* arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_all: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_all(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_bzip2: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_bzip2(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_compress: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_compress(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_gzip: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_gzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_lzip: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_lzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_lzma: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_lzma(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_none: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_none(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_programArg1: arg1 command: command [

	^ self ffiCall: #(int archive_read_support_compression_program(archive* arg1, const char* command))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_program_signatureArg1: arg1 arg2: arg2 arg3: arg3 size_t: size_t [

	^ self ffiCall: #(int archive_read_support_compression_program_signature(archive* arg1, const char* arg2, const void* arg3, size_t size_t))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_rpm: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_rpm(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_uu: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_uu(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_compression_xz: arg1 [

	^ self ffiCall: #(int archive_read_support_compression_xz(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_all: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_all(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_by_codeArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_support_filter_by_code(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_bzip2: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_bzip2(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_compress: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_compress(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_grzip: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_grzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_gzip: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_gzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_lrzip: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_lrzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_lz4: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_lz4(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_lzip: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_lzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_lzma: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_lzma(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_lzop: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_lzop(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_none: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_none(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_programArg1: arg1 command: command [

	^ self ffiCall: #(int archive_read_support_filter_program(archive* arg1, const char* command))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_program_signatureArg1: arg1 arg2: arg2 arg3: arg3 size_t: size_t [

	^ self ffiCall: #(int archive_read_support_filter_program_signature(archive* arg1, const char* arg2, const void* arg3, size_t size_t))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_rpm: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_rpm(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_uu: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_uu(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_xz: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_xz(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_filter_zstd: arg1 [

	^ self ffiCall: #(int archive_read_support_filter_zstd(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_7zip: arg1 [

	^ self ffiCall: #(int archive_read_support_format_7zip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_all: arg1 [

	^ self ffiCall: #(int archive_read_support_format_all(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_ar: arg1 [

	^ self ffiCall: #(int archive_read_support_format_ar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_by_codeArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_read_support_format_by_code(archive* arg1, int arg2))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_cab: arg1 [

	^ self ffiCall: #(int archive_read_support_format_cab(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_cpio: arg1 [

	^ self ffiCall: #(int archive_read_support_format_cpio(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_empty: arg1 [

	^ self ffiCall: #(int archive_read_support_format_empty(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_gnutar: arg1 [

	^ self ffiCall: #(int archive_read_support_format_gnutar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_iso9660: arg1 [

	^ self ffiCall: #(int archive_read_support_format_iso9660(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_lha: arg1 [

	^ self ffiCall: #(int archive_read_support_format_lha(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_mtree: arg1 [

	^ self ffiCall: #(int archive_read_support_format_mtree(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_rar5: arg1 [

	^ self ffiCall: #(int archive_read_support_format_rar5(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_rar: arg1 [

	^ self ffiCall: #(int archive_read_support_format_rar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_raw: arg1 [

	^ self ffiCall: #(int archive_read_support_format_raw(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_tar: arg1 [

	^ self ffiCall: #(int archive_read_support_format_tar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_warc: arg1 [

	^ self ffiCall: #(int archive_read_support_format_warc(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_xar: arg1 [

	^ self ffiCall: #(int archive_read_support_format_xar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_zip: arg1 [

	^ self ffiCall: #(int archive_read_support_format_zip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_zip_seekable: arg1 [

	^ self ffiCall: #(int archive_read_support_format_zip_seekable(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> read_support_format_zip_streamable: arg1 [

	^ self ffiCall: #(int archive_read_support_format_zip_streamable(archive* arg1))
]

{ #category : 'accessing' }
LibArchive >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFSameThreadRunner uniqueInstance;
		yourself
]

{ #category : 'public - archive' }
LibArchive >> seek_dataArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(la_int64_t archive_seek_data(archive* arg1, la_int64_t arg2, int arg3))
]

{ #category : 'accessing - platform' }
LibArchive >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libarchive.so'
]

{ #category : 'public - archive' }
LibArchive >> utility_string_sort: arg1 [

	^ self ffiCall: #(int archive_utility_string_sort(char** arg1))
]

{ #category : 'public - archive' }
LibArchive >> version_details [

	^ self ffiCall: #(const char* archive_version_details())
]

{ #category : 'public - archive' }
LibArchive >> version_number [

	^ self ffiCall: #(int archive_version_number())
]

{ #category : 'public - archive' }
LibArchive >> version_string [

	^ self ffiCall: #(const char* archive_version_string())
]

{ #category : 'accessing - platform' }
LibArchive >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'archive.dll'
]

{ #category : 'public - archive' }
LibArchive >> wincrypt_version [

	^ self ffiCall: #(const char* archive_wincrypt_version())
]

{ #category : 'public - archive' }
LibArchive >> write_add_filterArg1: arg1 filter_code: filter_code [

	^ self ffiCall: #(int archive_write_add_filter(archive* arg1, int filter_code))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_b64encode: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_b64encode(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_by_nameArg1: arg1 name: name [

	^ self ffiCall: #(int archive_write_add_filter_by_name(archive* arg1, const char* name))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_bzip2: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_bzip2(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_compress: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_compress(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_grzip: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_grzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_gzip: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_gzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_lrzip: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_lrzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_lz4: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_lz4(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_lzip: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_lzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_lzma: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_lzma(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_lzop: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_lzop(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_none: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_none(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_programArg1: arg1 cmd: cmd [

	^ self ffiCall: #(int archive_write_add_filter_program(archive* arg1, const char* cmd))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_uuencode: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_uuencode(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_xz: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_xz(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_add_filter_zstd: arg1 [

	^ self ffiCall: #(int archive_write_add_filter_zstd(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_close: arg1 [

	^ self ffiCall: #(int archive_write_close(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_dataArg1: arg1 arg2: arg2 size_t: size_t [

	^ self ffiCall: #(la_ssize_t archive_write_data(archive* arg1, const void* arg2, size_t size_t))
]

{ #category : 'public - archive' }
LibArchive >> write_data_blockArg1: arg1 arg2: arg2 size_t: size_t arg4: arg4 [

	^ self ffiCall: #(la_ssize_t archive_write_data_block(archive* arg1, const void* arg2, size_t size_t, la_int64_t arg4))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_gidArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(la_int64_t archive_write_disk_gid(archive* arg1, const char* arg2, la_int64_t arg3))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_new [

	^ self ffiCall: #(archive* archive_write_disk_new())
]

{ #category : 'public - archive' }
LibArchive >> write_disk_set_group_lookupArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_write_disk_set_group_lookup(archive* arg1, void* arg2, la_int64_t arg3, void* arg4))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_set_optionsArg1: arg1 flags: flags [

	^ self ffiCall: #(int archive_write_disk_set_options(archive* arg1, int flags))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_set_skip_fileArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_write_disk_set_skip_file(archive* arg1, la_int64_t arg2, la_int64_t arg3))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_set_standard_lookup: arg1 [

	^ self ffiCall: #(int archive_write_disk_set_standard_lookup(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_set_user_lookupArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 [

	^ self ffiCall: #(int archive_write_disk_set_user_lookup(archive* arg1, void* arg2, la_int64_t arg3, void* arg4))
]

{ #category : 'public - archive' }
LibArchive >> write_disk_uidArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(la_int64_t archive_write_disk_uid(archive* arg1, const char* arg2, la_int64_t arg3))
]

{ #category : 'public - archive' }
LibArchive >> write_fail: arg1 [

	^ self ffiCall: #(int archive_write_fail(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_finish: arg1 [

	^ self ffiCall: #(int archive_write_finish(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_finish_entry: arg1 [

	^ self ffiCall: #(int archive_write_finish_entry(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_free: arg1 [

	^ self ffiCall: #(int archive_write_free(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_get_bytes_in_last_block: arg1 [

	^ self ffiCall: #(int archive_write_get_bytes_in_last_block(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_get_bytes_per_block: arg1 [

	^ self ffiCall: #(int archive_write_get_bytes_per_block(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_headerArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_write_header(archive* arg1, archive_entry* arg2))
]

{ #category : 'public - archive' }
LibArchive >> write_new [

	^ self ffiCall: #(archive* archive_write_new())
]

{ #category : 'public - archive' }
LibArchive >> write_open2Arg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 arg5: arg5 arg6: arg6 [

	^ self ffiCall: #(int archive_write_open2(archive* arg1, void* arg2, archive_open_callback* arg3, archive_write_callback* arg4, archive_close_callback* arg5, archive_free_callback* arg6))
]

{ #category : 'public - archive' }
LibArchive >> write_openArg1: arg1 arg2: arg2 arg3: arg3 arg4: arg4 arg5: arg5 [

	^ self ffiCall: #(int archive_write_open(archive* arg1, void* arg2, archive_open_callback* arg3, archive_write_callback* arg4, archive_close_callback* arg5))
]

{ #category : 'public - archive' }
LibArchive >> write_open_FILEArg1: arg1 arg2: arg2 [

	^ self ffiCall: #(int archive_write_open_FILE(archive* arg1, FILE* arg2))
]

{ #category : 'public - archive' }
LibArchive >> write_open_fdArg1: arg1 _fd: _fd [

	^ self ffiCall: #(int archive_write_open_fd(archive* arg1, int _fd))
]

{ #category : 'public - archive' }
LibArchive >> write_open_fileArg1: arg1 _file: _file [

	^ self ffiCall: #(int archive_write_open_file(archive* arg1, const char* _file))
]

{ #category : 'public - archive' }
LibArchive >> write_open_filenameArg1: arg1 _file: _file [

	^ self ffiCall: #(int archive_write_open_filename(archive* arg1, const char* _file))
]

{ #category : 'public - archive' }
LibArchive >> write_open_filename_wArg1: arg1 _file: _file [

	^ self ffiCall: #(int archive_write_open_filename_w(archive* arg1, const int* _file))
]

{ #category : 'public - archive' }
LibArchive >> write_open_memoryArg1: arg1 _buffer: _buffer _buffSize: _buffSize _used: _used [

	^ self ffiCall: #(int archive_write_open_memory(archive* arg1, void* _buffer, size_t _buffSize, size_t* _used))
]

{ #category : 'public - archive' }
LibArchive >> write_set_bytes_in_last_blockArg1: arg1 bytes_in_last_block: bytes_in_last_block [

	^ self ffiCall: #(int archive_write_set_bytes_in_last_block(archive* arg1, int bytes_in_last_block))
]

{ #category : 'public - archive' }
LibArchive >> write_set_bytes_per_blockArg1: arg1 bytes_per_block: bytes_per_block [

	^ self ffiCall: #(int archive_write_set_bytes_per_block(archive* arg1, int bytes_per_block))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_bzip2: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_bzip2(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_compress: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_compress(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_gzip: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_gzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_lzip: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_lzip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_lzma: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_lzma(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_none: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_none(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_programArg1: arg1 cmd: cmd [

	^ self ffiCall: #(int archive_write_set_compression_program(archive* arg1, const char* cmd))
]

{ #category : 'public - archive' }
LibArchive >> write_set_compression_xz: arg1 [

	^ self ffiCall: #(int archive_write_set_compression_xz(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_filter_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_write_set_filter_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> write_set_formatArg1: arg1 format_code: format_code [

	^ self ffiCall: #(int archive_write_set_format(archive* arg1, int format_code))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_7zip: arg1 [

	^ self ffiCall: #(int archive_write_set_format_7zip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_ar_bsd: arg1 [

	^ self ffiCall: #(int archive_write_set_format_ar_bsd(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_ar_svr4: arg1 [

	^ self ffiCall: #(int archive_write_set_format_ar_svr4(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_by_nameArg1: arg1 name: name [

	^ self ffiCall: #(int archive_write_set_format_by_name(archive* arg1, const char* name))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_cpio: arg1 [

	^ self ffiCall: #(int archive_write_set_format_cpio(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_cpio_bin: arg1 [

	^ self ffiCall: #(int archive_write_set_format_cpio_bin(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_cpio_newc: arg1 [

	^ self ffiCall: #(int archive_write_set_format_cpio_newc(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_cpio_odc: arg1 [

	^ self ffiCall: #(int archive_write_set_format_cpio_odc(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_cpio_pwb: arg1 [

	^ self ffiCall: #(int archive_write_set_format_cpio_pwb(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_filter_by_extA: a filename: filename [

	^ self ffiCall: #(int archive_write_set_format_filter_by_ext(archive* a, const char* filename))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_filter_by_ext_defA: a filename: filename def_ext: def_ext [

	^ self ffiCall: #(int archive_write_set_format_filter_by_ext_def(archive* a, const char* filename, const char* def_ext))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_gnutar: arg1 [

	^ self ffiCall: #(int archive_write_set_format_gnutar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_iso9660: arg1 [

	^ self ffiCall: #(int archive_write_set_format_iso9660(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_mtree: arg1 [

	^ self ffiCall: #(int archive_write_set_format_mtree(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_mtree_classic: arg1 [

	^ self ffiCall: #(int archive_write_set_format_mtree_classic(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_write_set_format_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_pax: arg1 [

	^ self ffiCall: #(int archive_write_set_format_pax(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_pax_restricted: arg1 [

	^ self ffiCall: #(int archive_write_set_format_pax_restricted(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_raw: arg1 [

	^ self ffiCall: #(int archive_write_set_format_raw(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_shar: arg1 [

	^ self ffiCall: #(int archive_write_set_format_shar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_shar_dump: arg1 [

	^ self ffiCall: #(int archive_write_set_format_shar_dump(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_ustar: arg1 [

	^ self ffiCall: #(int archive_write_set_format_ustar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_v7tar: arg1 [

	^ self ffiCall: #(int archive_write_set_format_v7tar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_warc: arg1 [

	^ self ffiCall: #(int archive_write_set_format_warc(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_xar: arg1 [

	^ self ffiCall: #(int archive_write_set_format_xar(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_format_zip: arg1 [

	^ self ffiCall: #(int archive_write_set_format_zip(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_set_option_a: _a m: m o: o v: v [

	^ self ffiCall: #(int archive_write_set_option(archive* _a, const char* m, const char* o, const char* v))
]

{ #category : 'public - archive' }
LibArchive >> write_set_options_a: _a opts: opts [

	^ self ffiCall: #(int archive_write_set_options(archive* _a, const char* opts))
]

{ #category : 'public - archive' }
LibArchive >> write_set_passphrase_a: _a p: p [

	^ self ffiCall: #(int archive_write_set_passphrase(archive* _a, const char* p))
]

{ #category : 'public - archive' }
LibArchive >> write_set_passphrase_callbackArg1: arg1 client_data: client_data arg3: arg3 [

	^ self ffiCall: #(int archive_write_set_passphrase_callback(archive* arg1, void* client_data, archive_passphrase_callback* arg3))
]

{ #category : 'public - archive' }
LibArchive >> write_set_skip_fileArg1: arg1 arg2: arg2 arg3: arg3 [

	^ self ffiCall: #(int archive_write_set_skip_file(archive* arg1, la_int64_t arg2, la_int64_t arg3))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_bzip2: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_bzip2(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_deflate: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_deflate(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_lzma: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_lzma(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_store: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_store(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_xz: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_xz(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> write_zip_set_compression_zstd: arg1 [

	^ self ffiCall: #(int archive_write_zip_set_compression_zstd(archive* arg1))
]

{ #category : 'public - archive' }
LibArchive >> zlib_version [

	^ self ffiCall: #(const char* archive_zlib_version())
]
