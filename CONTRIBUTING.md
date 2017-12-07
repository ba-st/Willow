How to contribute
=================

There's several ways to contribute to the project: reporting bugs, sending feedback, proposing ideas for new features, fixing or adding documentation, promoting the project, or even contributing code changes.

## How to report issues

The issue tracker is this GitHub repository. Please use the labels to categorize the issue.

## How to contribute code

> Remember:
- This project is MIT licensed, so any code contribution must be under the same license.
- This project uses [semantic versioning](http://semver.org/), so keep it in mind when you make backwards-incompatible changes. If some backwards incompatible change is made the major version MUST be increased.
- The source code is hosted in this GitHub repository using the filetree format in the `source` folder. The master branch contains the latest changes, feel free to send pull requests or fork the project.
- Code contributions without test cases have a lower probability of being merged into the main branch.

- Install/Get Pharo 6
- Clone this repository or fork it
- Load the development version with:
```smalltalk
Metacello new
  baseline: 'Willow';
  repository: 'filetree://REPO_LOCATION/source';
  load: 'Development'.
```
- Do the changes and save it from Pharo (don't forget to add some test cases)
- Create a branch, commit using the usual Git tooling and open a Pull Request

Remember the docs are licensed under a CC Attribution-ShareAlike license.

## How to release a new version

The master branch should always contain a releasable version, so all the test cases must be passing. The released versions are managed as tags using the GitHub releases support.
1. The following code changes should be made before the release:
 - Update version number in `package.json`
 - Update version number in `WillowNamespaceFileMetadataLibrary class>>version`
 - Fix the test cases related to version numbers
2. Merge this changes to master
3. Edit the release draft, add any missing info about the release and publish it
4. Make the public announcement


### Useful References:

- [W3C HTML5 Home](https://www.w3.org/TR/html5/)
