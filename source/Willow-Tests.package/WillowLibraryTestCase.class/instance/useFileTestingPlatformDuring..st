private
useFileTestingPlatformDuring: aBlock

	| installedPlatform |

	installedPlatform := GRPlatform current.
	[ GRPlatform current: (WillowFileTestingPlatform wrapping: installedPlatform).
	aBlock value ]
		ensure: [ GRPlatform current: installedPlatform ]