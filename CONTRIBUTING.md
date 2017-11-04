How to contribute
=================

There's several ways to contribute to the project: reporting bugs, sending feedback, proposing ideas for new features, fixing or adding documentation, promoting the project, or even contributing code changes.

## How to report issues

The issue tracker is this GitHub repository. Please use the labels to categorize the issue. 

## How to contribute code

Remember:
- This project is MIT licensed, so any code contribution must be under the same license.
- This project uses [semantic versioning](http://semver.org/), so keep it in mind when you make backwards-incompatible changes. If some backwards incompatible change is made the major version MUST be increased.
- The source code is hosted in this GitHub repository using the filetree format in the `source` folder. The master branch contains the latest changes, feel free to send pull requests or fork the project. 
- Code contributions without test cases have a lower probability of being merged into the main branch.


- Clone this repository or fork it
- Load the corresponding development version with:
The development version can be loaded in a Pharo 5/6 image evaluating the following code snippet:
```smalltalk
Metacello new
  baseline: 'Willow';
  repository: 'filetree://REPO_LOCATION/source';
  load: 'Development'.
```

- Do the changes and save it from Pharo (don't forget to add some test cases)
- Create a branch, commit using the usual Git tooling and open a Pull Request

Remember the docs are licensed under a CC Attribution-ShareAlike license. 

### Useful References:

- [W3c Css Home](http://www.w3.org/Style/CSS/)
