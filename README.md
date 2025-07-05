This are [Pharo](https://github.com/pharo-project/pharo) bindings for [libarchive](https://libarchive.org) 
library, generated using [pharo-cig](https://github.com/estebanlm/pharo-cig).  

The generation recipe can be found at the class comment of [LibArchive class](https://github.com/estebanlm/pharo-archive/blob/main/src/Archive/LibArchive.class.st).

### Usage example

```smalltalk
"list contents of a file"
| fileRef arc archive paths entryHolder entry |

arc := LibArchive uniqueInstance.

fileRef := '/path/to/file.zip' asFileReference.
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
[ (arc read_next_headerArg1: archive arg2: entryHolder) = 0 ] 
whileTrue: [ 
	entry := entryHolder value.
	paths add: (arc entry_pathname: entry). 
	arc read_data_skip: archive.
].

arc read_free: archive.

paths inspect
```
