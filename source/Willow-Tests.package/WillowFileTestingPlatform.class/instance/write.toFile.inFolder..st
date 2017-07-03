file library
write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString

	createdFiles add: ('<1s>/<2s>' expandMacrosWith: aFolderString with: aFileNameString)