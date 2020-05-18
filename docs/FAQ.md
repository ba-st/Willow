FAQ
===

1. How to avoid the `AssertionFailed: The identifier was never assigned` error?

  This error is raised when you're asking to some component its `identifier`, but it's not available (probably because the component hasn't been rendered yet). In case the rendering will happen later, and you have a canvas available, you should order the component to identify itself in that canvas.

  For example
  ```smalltalk
  button onTrigger executeOnClient: [ :script :canvas |
            identifiedView identifyIn: canvas.
            script << (canvas jQuery id: identifiedView identifier) html: 'Loading...' ]
  ```

2. How to debug a Willow Application

  By default yo will get standard HTTP errors when some unexpected thing happens. If you want to get a debugger when something fails, you need to configure the error handler:

  For example
  ```smalltalk
  | application |
  application := MyWillowApplication registerAsDevelopmentApplication.
  application filter configuration
		  at: #exceptionHandler
		  put: WADebugErrorHandler.
  ```
  If `WADebugErrorHandler` is missing on your image you will need to load the `Development` group of the baseline or load the required Seaside packages.
