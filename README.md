![Logo](resources/logos/128x128.png) Willow
======
![GitHub release](https://img.shields.io/github/release/ba-st/Willow.svg)
[![Build Status](https://travis-ci.org/ba-st/Willow.svg?branch=master)](https://travis-ci.org/ba-st/Willow)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Willow/badge.svg?branch=master)](https://coveralls.io/github/ba-st/Willow?branch=master)
[![Javascript Dependency Status](https://david-dm.org/ba-st/Willow.svg)](https://david-dm.org/ba-st/Willow)

##### Ready-to-use components for interactive web applications + framework agnostic integration

## Getting started
### Before installing
[Willow](https://github.com/ba-st/Willow) is developed using [Smalltalk](http://stephane.ducasse.free.fr/FreeBooks.html), providing a simple interface for your web application, no matter the front-end framework you choose.

The tutorials below assume you are familiar with Smalltalk code, and are using [Pharo](http://pharo.org/) as your development environment. Willow is intended to work alongside the [RenoirSt](https://github.com/ba-st/RenoirSt) DSL to define the CSS of your application. Some basic knowledge of [Seaside](https://github.com/SeasideSt/Seaside) is also recommended.
### Installation
Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Willow';
  repository: 'github://ba-st/Willow:master/source';
  load
```

### Adding front-end framework support
Willow uses an HTML5 component provider by default. To work with a particular framework, you should install:

Framework | Project | Status
--- | --- | --- 
[Bootstrap 3](https://getbootstrap.com/docs/3.3/) | [Willow-Bootstrap](https://github.com/ba-st/Willow-Bootstrap) | ![Active](http://www.repostatus.org/badges/latest/active.svg)|
[JQuery UI](https://jqueryui.com/) | [Willow-JQueryUI](https://github.com/ba-st/Willow-JQueryUI) | ![Active](http://www.repostatus.org/badges/latest/active.svg)
[Semantic UI](https://semantic-ui.com/) | [Willow-SemanticUI](https://github.com/ba-st/Willow-SemanticUI) | ![WIP](http://www.repostatus.org/badges/latest/wip.svg)
[Materialize](http://materializecss.com/) | [Willow-Materialize](https://github.com/fortizpenaloza/Willow-Materialize) | ![WIP](http://www.repostatus.org/badges/latest/wip.svg)

## Tutorial
To learn more about Willow, load [Willow-Playground](https://github.com/ba-st/Willow-Playground) and check the Presentation application. These will also install 2 sample applications: Test Runner and Live Documentation.

## Running the tests
Willow provides a complete coverage of its features. Open a Test Runner and find the test packages (*Willow-Tests-**).

Currently the file deployment tests for the libraries are failing on Windows. This is due to the way Seaside is managing URLs, and [should be fixed soon](https://github.com/SeasideSt/Seaside/pull/944).

## Deployment
In order to include Willow as part of your project, you should reference the *default*/*Deployment* package in your product baseline.
For example:
```
setUpDependencies: spec

	spec
		baseline: 'Willow'
			with: [ spec
				repository: 'github://ba-st/Willow:v8/source';
				loads: #('Willow') ]
```
and
```
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('Willow') ] ]
```
This might vary if you choose a specific framework, since the derived projects already declare the dependency to Willow, so you should indicate those instead.

## Contributing

**Source Code Repository** and **Issue Tracking**: In this GitHub repository.

If you want to help check the [Contribution Guidelines](CONTRIBUTING.md).

## Credits
- Willow was first presented in the [Smalltalks 2013 Conference](http://fast.org.ar).
A video of the presentation can be seen [here](https://youtu.be/JezITRHCBuc?list=PLCGAAdUizzH027lLWKXh_44cGuEsay7-R).

- A follow up presentation was made in the Smalltalks 2017 Conference. The slides are available [here](https://www.slideshare.net/gcotelli/willow-101-82159948) and a video of the presentation can be seen [here](https://youtu.be/-QmvIBLDASM).

- Work started by [Maximiliano Tabacman](https://github.com/mtabacman). Code improvement provided by [Gabriel Cotelli](https://github.com/gcotelli). Additional ideas and fixes by [Francisco Ortiz Peñaloza](https://github.com/fortizpenaloza) and [Julián Maestri](https://github.com/serpi90).

- Real world scenarios and coding time granted by [Mercap Software](https://www.mercapsoftware.com/en/).

## Licensing
The project source code is [MIT](LICENSE) licensed. Any contribution submitted to the code repository is considered to be under the same license.

The documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)
