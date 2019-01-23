Contributing
============

There's several ways to contribute to the project: reporting bugs, sending feedback, proposing ideas for new features, fixing or adding documentation, promoting the project, or even contributing code.

## Reporting issues

You can report issues [here](https://github.com/ba-st/Willow/issues/new)

## Contributing Code
- This project is MIT licensed, so any code contribution MUST be under the same license.
- This project uses [Semantic Versioning](http://semver.org/), so keep it in mind when you make backwards-incompatible changes. If some backwards incompatible change is made the major version MUST be increased.
- The source code is hosted in this repository using the Tonel format in the `source` folder.
- The `release-candidate` branch contains the latest changes and should always be in a releasable state.
- Feel free to send pull requests or fork the project.
- Code contributions without test cases have a lower probability of being merged into the main branch.

### Using Iceberg
1. Download a [Pharo Image and VM](https://get.pharo.org/64)
2. Clone the project or your fork using Iceberg
3. Open the Working Copy and using the contextual menu select `Metacello -> Install baseline...`
4. Input `Development`
5. This will load the base code and the test cases
6. Create a new branch to host your code changes
7. Do the changes
8. Run the test cases
9. Commit and push your changes to the branch using the Iceberg UI
10. Create a Pull Request against the `release-candidate` branch

## Contributing documentation

The project documentation is maintained in this repository in the `docs` folder and licensed under CC BY-SA 4.0. To contribute some documentation or improve the existing, feel free to create a branch or fork this repository, make your changes and send a pull request.

## How to release a new version

The `release-candidate` branch should always contain a releasable version, so all the test cases must be passing. The released versions are managed as tags using the GitHub releases support.
1. The following code changes should be made before the release:
 - Update version number in `package.json`
 - If there was changes in WillowNamespaceFileMetadataLibrary file contents (there's a test checking that using the hash)
   - Update version number in `WillowNamespaceFileMetadataLibrary class>>version`
   - Fix the test cases related to version numbers
2. Follow the instructions in the [community guidelines](https://github.com/ba-st/Community/blob/master/docs/CodingStandards.md#releasing-a-new-version)


### Useful References:

- [W3C HTML5 Home](https://www.w3.org/TR/html5/)
