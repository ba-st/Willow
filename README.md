![Logo](resources/logos/128x128.png) Willow
======
[![Build Status](https://travis-ci.org/ba-st/Willow.svg?branch=master)](https://travis-ci.org/ba-st/Willow)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Willow/badge.svg?branch=master)](https://coveralls.io/github/ba-st/Willow?branch=master)
[![Javascript Dependency Status](https://david-dm.org/ba-st/Willow.svg)](https://david-dm.org/ba-st/Willow)

*Willow is a Web Interaction Library that eases the burden of creating AJAX-based web applications*

## Goals
- Provide a Smalltalk protocol for the interactive behavior of web components
- Reify the pieces of a web application to improve reuse
- Offer a simple and polymorphic protocol for different front-end frameworks 

### License:
The project source code is [MIT](LICENSE) licensed. Any contribution submitted to the code repository is considered to be under the same license.

The documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)

### Dependencies:
It's built on top of the [Seaside](https://github.com/SeasideSt/Seaside) Web Framework providing a set of composable components and easier AJAX interaction.
It's intented to work alongside the [RenoirSt](https://github.com/ba-st/RenoirSt) DSL to define the CSS of your application.

### Highlights:
- **Supported Platforms**: [Pharo 5 / Pharo 6](http://www.pharo.org/)
- **Source Code Repository** and **Issue Tracking**: In this GitHub repository.

### Get started!

#### Pharo 5/6

Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Willow';
  repository: 'github://ba-st/Willow:master/source';
  load
```

Willow already includes an HTML5 component provider.
To work with [Bootstrap 3](https://getbootstrap.com/docs/3.3/) you should also install  [Willow-Bootstrap](https://github.com/ba-st/Willow-Bootstrap).
To work with [JQuery UI](https://jqueryui.com/) you should also install  [Willow-JQueryUI](https://github.com/ba-st/Willow-JQueryUI).

### Tutorial
To learn more about Willow, load [Willow-Playground](https://github.com/ba-st/Willow-Playground) and check the Presentation application. These will also install 2 sample applications: Test Runner and Live Documentation.

### History:
Willow was first presented in the [Smalltalks 2013 Conference](http://fast.org.ar). 
A video of the presentation can be seen [here](https://youtu.be/JezITRHCBuc?list=PLCGAAdUizzH027lLWKXh_44cGuEsay7-R).

### Contributing
If you want to help check the ["How to contribute" doc](CONTRIBUTING.md).
