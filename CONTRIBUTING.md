# Contributing

There are several ways to contribute to the project: reporting bugs, sending
feedback, proposing ideas for new features, fixing or adding documentation,
promoting the project, or even contributing code.

## Reporting issues

You can report issues [here](https://github.com/ba-st/Willow/issues/new)

## Contributing Code

- This project is MIT licensed, so any code contribution MUST be under the same license.
- This project uses [Semantic Versioning](http://semver.org/), so keep it in
  mind when you make backwards-incompatible changes. If some backwards
  incompatible change is made the major version MUST be increased.
- The source code is hosted in this repository using the Tonel format in the
  `source` folder.
- The `release-candidate` branch contains the latest changes and should always
  be in a releasable state.
- Feel free to send pull requests or fork the project.
- Code contributions without test cases have a lower probability of being merged
  into the main branch.

1. [Load the project code in a Pharo image](docs/how-to/how-to-load-in-pharo.md)
2. Create a new branch to host your code changes
3. Do the changes
4. Run the test cases
5. Commit and push your changes to the branch using the Iceberg UI. You may need
  to add your fork if lacking the required permissions to push to the main repo.
6. Create a Pull Request against the `release-candidate` branch

## Contributing documentation

The project documentation is maintained in this repository in the `docs` folder
and licensed under CC BY-SA 4.0. To contribute some documentation or improve the
existing, feel free to create a branch or fork this repository, make your
changes and send a pull request.

### Useful References

- [W3C HTML5 Home](https://www.w3.org/TR/html5/)
