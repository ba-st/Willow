# How to release a new version

The `release-candidate` branch should always contain a releasable version, so
all the test cases must be passing. The released versions are managed as tags
using the GitHub releases support.

- The following code changes should be made before the
  release:
  - Update version number in `package.json`
  - If there were changes in `WillowNamespaceFileMetadataLibrary` file contents
  (there's a test checking that using the hash)
  - Update version number in `WillowNamespaceFileMetadataLibrary class>>version`
  - Fix the test cases related to version numbers
- Follow the instructions in the [community guidelines](https://github.com/ba-st/Community/blob/master/docs/CodingStandards.md#releasing-a-new-version)
