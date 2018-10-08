# Applications

To create your own web application with Willow you need to subclass `WillowApplication` and provide the required implementations:

- `YourApp class>>#applicationTitle` must provide the application name, this is what will get shown on the browser tab
- `YourApp class>>#handlerName` must provide the application entry point, for example: `your-app`
- `YourApp>>#componentSupplierForApplication` must provide a component supplier (some subclass of `FrontendComponentSupplier`) configured as you wish
- `YourApp>>#jQueryLibrary` must provide the jQuery library to use, if your app will be online the recommended one is `JQuery3OnlineLibrary default`, if your app will be self-hosted and won't have access to the Internet you will need something like: `(self deploymentMode libraryFor: JQuery3MetadataLibrary) default`
- `YourApp>>#contentView` This method should eventually point to the content of your application. This means you must return a renderable object (as defined by Seaside).

Now you just need to start your Seaside server adaptor and register the new app in the dispatcher. You can register your app with: `YourApp registerAsDeployedApplication` or `YourApp registerAsDevelopmentApplication` depending on the deployment mode you want to use (more on that later).

You can unregister your app from the dispatcher at any time by sending: `YourApp unregisterFromApplications`.

## Deployment Modes

Willow supports two different registration modes: Deployment and Development. The main differences are:

- Determining the type of self hosted libraries. In Development you will get the non-minified files served and in Deployment you will get the minified versions. This is resolved in collaboration with the libraries.
- The mode is also used to change the file handler behavior, so as to ignore the libraries corresponding to non-matching modes
- It can be extended and used for your own purposes, when there's code that needs to differ between Development and Deployment:
  - To configure a CDN to use for the libraries just in deployment
  - To implement different transactional semantics
  - Just use your imagination :)

## Error Handling

You should consider two types of error handling in your app. The first is server-side, so when you receive a request and something fails during processing you need to specify how to handle the situation. The other is client-side, when some AJAX call you're making timeouts, or receives and erroneous response.

For the server-side configuration, you must re-implement `YourApp class>>#errorHandlerFactory` and configure the error handler:
- You can configure a `reportingAction:` that will be evaluated for both AJAX and non AJAX requests when something unexpected occurs. It's a good place to dump a stack trace and log errors.
- `updateRootWith:` and `renderNonAjaxErrorsWith:` can be used to customize what happens when rendering errors with code 5xx.
- Sending `on:do:` you can setup error handlers specific for AJAX calls. In case no handler applies the standard handling mechanics take control.

For the client-side some Javascript is required, because if the server is not responding some feedback should be provided to the user. You can write it by hand or just creates a library and use the Seaside rendering/javascript capabilities to produce it. You can see a working example in the [Willow Playground](https://github.com/ba-st/Willow-Playground), just browse `Smalltalks2017FileMetadataLibrary >> willowplaygrounderrorhandlerJsContent`.

If you want to do it by hand you could do something something like:

```javascript
(function() {
  Willow.handleAjaxErrorCall = function(theXMLHttpRequest, textStatus, errorThrown) {
    if (theXMLHttpRequest.getAllResponseHeaders()) {
      if (theXMLHttpRequest["status"] == "403") {
      	/* Your code */
      }
      /* Further cases handling */
    }
  }
}())
```
Be aware to load this after the Willow code is loaded.

## Libraries

Supporting libraries in Willow come in 3 flavors:
- Online
- Deployment
- Development

When you select a component supplier for your application it will take care of adding the relevant libraries. If you return a `BootstrapComponentSupplier`, once your app gets rendered the document `<head>` will include all the links to the js, css and any relevant files needed.

If you're using additional libraries, they can be easily included in the `<head>` by reimplementing `requiredLibraries` and returning a collection of the relevant ones. So for example if you're using the Spin Kit additions, you can implement:

```smalltalk
YourApp>>#requiredLibraries

	^ {SpinKitMetadataLibrary default}
```
This will ensure the files required by Spin Kit are mentioned in the document head.

## Sessions

For the most basic applications you can use the standard Willow session. Once your app starts growing in features, to keep things under control it might be a good idea to have a unique point of interaction with your backend services, API or in-image model. To achieve that Willow applications provide a hook so you can have your own "Application Context" easily accesible from each component.

You must subclass WillowSession, and hook up in the method `startUpApplicationContextFor:` creating or getting your application context and saving it on the session. (Don't forget to do `super startUpApplicationContextFor: aWillowApp`). Later, you can easily access your context by collaborating with the session by sending `self session`, which will get you access to it in any component.

## Further Configuration

### Language Configuration

Some libraries used in Willow include language and transalation support. For them to work reliably you must first configure the application language. The default is `WALocale fromString: 'en'`. To use another language you need to implement `registerAsApplicationUsing:` with code similar to:

```smalltalk
registerAsApplicationUsing: deploymentModeClass

	| application |

	application := super registerAsApplicationUsing: deploymentModeClass.
	application preferenceAt: WillowSystemConfiguration languageKey put: 'es'.
	^application
```

### Setting up a CDN

For libraries with an official CDN (bootstrap, jquery, etc), you can indicate to the application that the online version of the libraries objects must be used:

```smalltalk
componentSupplierForApplication

  ^ BootstrapComponentSupplier online

jQueryLibrary

    ^JQuery3OnlineLibrary default
```

For libraries with no offical CDN, you can deploy the static files to disk in your build, and then upload them to a CDN service.

To achieve this, first execute:
```smalltalk
| libraries |
libraries := { WillowNamespaceFileMetadataLibrary default }.
libraries do: [:library | library deployFiles ]
```
Then, take the generated files and upload them to a static file service. Finally, implement in your application:

```
YourApp>>installFileHandlerAccordingTo: deploymentMode

    deploymentMode
        ifDeployedDo: [
            WillowFileHandler
                installAsFileHandlerAccordingTo: deploymentMode
                servedAt: 'https://your-own-subdomain.awesome-cdn.com' seasideUrl]
        else: [super installFileHandlerAccordingTo: deploymentMode
```

This will make the `<header>` contain something similar to:

```html
<script type="text/javascript" src="https://your-own-subdomain.awesome-cdn.com/willow-6.0.0/js/willow.js"></script>
```
