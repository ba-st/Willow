FAQ
===

1. How to debug a Willow Application

  By default you will get standard HTTP errors when some unexpected thing happens. If you want to get a debugger when something fails, you need to configure the error handler:

  For example
  ```smalltalk
  | application |
  application := MyWillowApplication registerAsDevelopmentApplication.
  application filter configuration
		  at: #exceptionHandler
		  put: WADebugErrorHandler.
  ```
  If `WADebugErrorHandler` is missing on your image you will need to load the `Development` group of the baseline or load the required Seaside packages.
