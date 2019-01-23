<p align="center"><img src="assets/logos/128x128.png">
 <h1 align="center">Willow</h1>
  <p align="center">
    Ready-to-use components for interactive web applications + framework agnostic integration
    <br>
    <a href="docs/"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/ba-st/Willow/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/ba-st/Willow/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![GitHub release](https://img.shields.io/github/release/ba-st/Willow.svg)](https://github.com/ba-st/Willow/releases/latest)
[![Build Status](https://travis-ci.org/ba-st/Willow.svg?branch=release-candidate)](https://travis-ci.com/ba-st/Willow)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Willow/badge.svg?branch=release-candidate)](https://coveralls.io/github/ba-st/Willow?branch=release-candidate)
[![Javascript Dependency Status](https://david-dm.org/ba-st/Willow.svg)](https://david-dm.org/ba-st/Willow)

[Willow](https://github.com/ba-st/Willow) is developed using [Smalltalk](http://stephane.ducasse.free.fr/FreeBooks.html), providing a simple interface for your web application, no matter the front-end framework you choose.

The tutorials below assume you are familiar with Smalltalk code, and are using [Pharo](http://pharo.org/) as your development environment. Willow is intended to work alongside the [RenoirSt](https://github.com/ba-st/RenoirSt) DSL to define the CSS of your application. Some basic knowledge of [Seaside](https://github.com/SeasideSt/Seaside) is also recommended.

## License
- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Quick Start

- Download the latest [Pharo 32](https://get.pharo.org/) or [64 bits VM](https://get.pharo.org/64/).
- Download a ready to use image from the [release page](https://github.com/ba-st/Willow/releases/latest)
- Explore the [documentation](docs/)

## Tutorial
To learn more about Willow, load [Willow-Playground](https://github.com/ba-st/Willow-Playground) and check the Presentation application. These will also install 2 sample applications: Test Runner and Live Documentation.

Also you can check the [FAQs](docs/FAQ.md) and the rest of the documentation available in the docs folder.

There is also some introductory posts [here](https://medium.com/mercap-tech-blog/). And you can ask questions in the #willow channel at [ba-st.slack.com](https://ba-st.slack.com/) or the #willow channel in the Pharo Discord server.

### Adding front-end framework support
Willow uses an HTML5 component provider by default. To work with a particular framework, you should install:

Framework | Project | Status
--- | --- | ---
[Bootstrap 3](https://getbootstrap.com/docs/3.3/) | [Willow-Bootstrap](https://github.com/ba-st/Willow-Bootstrap) | ![Active](http://www.repostatus.org/badges/latest/active.svg)
[JQuery UI](https://jqueryui.com/) | [Willow-JQueryUI](https://github.com/ba-st/Willow-JQueryUI) | ![Active](http://www.repostatus.org/badges/latest/active.svg)
[Semantic UI](https://semantic-ui.com/) | [Willow-SemanticUI](https://github.com/ba-st/Willow-SemanticUI) | ![WIP](http://www.repostatus.org/badges/latest/wip.svg)

### Adding extensions

Extension | Project
---|---
Mixpanel | [Willow Mixpanel](https://github.com/ba-st/Willow-Mixpanel)
Spinners | [Willow SpinKit](https://github.com/ba-st/Willow-SpinKit)

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)

## Credits
- Willow was first presented in the [Smalltalks 2013 Conference](http://fast.org.ar).
A video of the presentation can be seen [here](https://youtu.be/JezITRHCBuc?list=PLCGAAdUizzH027lLWKXh_44cGuEsay7-R).

- A follow up presentation was made in the Smalltalks 2017 Conference. The slides are available [here](https://www.slideshare.net/gcotelli/willow-101-82159948) and a video of the presentation can be seen [here](https://youtu.be/-QmvIBLDASM).

- Another follow up presentation was mande in the ESUG 2018 and Smalltalks 2018 conferences. The slides are available [here](https://www.slideshare.net/FASTPresentations/willow-the-interaction-tour-by-maxi-tabacman) and a video of the presentation can be seen [here](https://youtu.be/U6-JoPRcXHc)

- Work started by [Maximiliano Tabacman](https://github.com/mtabacman). Code improvements provided by [Gabriel Cotelli](https://github.com/gcotelli). Additional ideas and fixes by [Francisco Ortiz Peñaloza](https://github.com/fortizpenaloza) and [Julián Maestri](https://github.com/serpi90).

- Real world scenarios and coding time granted by [Mercap Software](https://www.mercapsoftware.com/en/).
