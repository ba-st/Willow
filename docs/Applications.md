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

Willow supports two deployment modes: Deployment and Development. The main differences are:

- The deployment mode is use to resolve self hosted libraries, so in Development you will get the non minified files served and in Deployment you will get the minified versions. This is resolved in collaboration with the libraries.
- The mode is also used to change the file handler behavior to ignore the libraries corresponding to non matching modes
- It can be extended and used for your own purposes for code that needs to differ between Development and Deployment:
  - To configure a CDN to use for the libraries just in deployment
  - To implement different transactional semantics
  - Just use your imagination :)

## Error Handling

You should consider two types of error handling in your app. The first one server side, so when you receive a request and something fails processing it you need to specify how to handle the situation. The other client side, when some AJAX call you're making timeouts, or receives and erroneous response.

The first one is setup by re-implementing `YourApp class>>#errorHandlerFactory` and configuring further the error handler:
- You can configure a `reportingAction:` that will be evaluated for both AJAX and non AJAX requests when something unexpected passes. It's a good place to dump an stack trace and log some error.
- `updateRootWith:` and `renderNonAjaxErrorsWith:` can be used to customized what gets rendered on 500 errors.
- Sending `on:do:` you can setup error handlers specific for AJAX calls, if no one can handle the error the standard handling mechanics take control.

For the second one you will need a bit of Javascript because when the server is not responding you need to at least show something to the user. You can write it by hand or just creates a library and use the Seaside rendering/javascript capabilities to produce it. We have and example in the [Willow Playground](https://github.com/ba-st/Willow-Playground), just browse `Smalltalks2017FileMetadataLibrary >> willowplaygrounderrorhandlerJsContent`.

If you want to do it by hand you need something like:

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
just be aware to load that after the Willow code is loaded.

## Libraries

The supporting libraries in Willow tends to be in 3 flavors:
- Online
- Deployment
- Development

When you select a component supplier for your application it takes care of adding the relevant libraries. So if you return a `BootstrapComponentSupplier` when your app gets rendered it will include in the document `<head>` all the links to the js, css and any relevant files needed.

If you're using additional libraries, you can easily include it in the `<head>` by reimplementing `requiredLibraries` and returning a collection of the relevant ones. So for example if you're using the Spin Kit additions you can implement:

```smalltalk
YourApp>>#requiredLibraries

	^ {SpinKitMetadataLibrary default}
```
and the relevant files will be in the document head.

## Sessions

For really tiny apps you can use the standard Willow session. But when your app starts growing if you want to keep the things in control is a good idea to have some kind of unique point of interaction with your backend services, API or even in image model. For that Willow applications provide a hook so you can have your own "Application Context" easily accesible from each component.

To use it you need to subclass WillowSession, and hook up in the method `startUpApplicationContextFor:` creating or getting your application context and saving it on the session. (Don't forget to do `super startUpApplicationContextFor: aWillowApp`). Later you can easily access your context by collaborating with the session: `self session`
will get you access to it in any component.

## Further Configuration

### Language Configuration

Some libraries used in Willow include language and transalation support, but for it to work reliably you need to configure the application language. By default if no further configuration is provided it will use `WALocale fromString: 'en'`. To use another language you need to implement `registerAsApplicationUsing:` doing something like:

```smalltalk
registerAsApplicationUsing: deploymentModeClass

	| application |

	application := super registerAsApplicationUsing: deploymentModeClass.
	application preferenceAt: WillowSystemConfiguration languageKey put: 'es'.
	^application
```

### Setting up a CDN

For the libraries having an official CDN (bootstrap, jquery, etc) you can use it just by changing the application to use the online version of the libraries:

```smalltalk
componentSupplierForApplication

  ^ BootstrapComponentSupplier online

jQueryLibrary

    ^JQuery3OnlineLibrary default
```

For the libraries with no offical CDN, you can deploy the static files to disk in your build and upload it to some CDN service, at a minimum you will need:
```smalltalk
| libraries |
libraries := { WillowNamespaceFileMetadataLibrary default }.
libraries do: [:library | library deployFiles ]
```
and take all this files and upload them to a static file service, so then you can change:

```
YourApp>>installFileHandlerAccordingTo: deploymentMode

    deploymentMode
        ifDeployedDo: [
            WillowFileHandler
                installAsFileHandlerAccordingTo: deploymentMode
                servedAt: 'https://your-own-subdomain.awesome-cdn.com' seasideUrl]
        else: [super installFileHandlerAccordingTo: deploymentMode
```

So in the  `<header>` you will end up with something like:

```html
<script type="text/javascript" src="https://your-own-subdomain.awesome-cdn.com/willow-6.0.0/js/willow.js"></script>
```
