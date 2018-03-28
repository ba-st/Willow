*Willow-Tests
useFileTestingPlatformDuring: aBlock

	| installedPlatform |

	installedPlatform := GRPlatform current.
	[ GRPlatform current: (WAFileTestingPlatform wrapping: installedPlatform).
	aBlock value ]
		ensure: [ GRPlatform current: installedPlatform ]