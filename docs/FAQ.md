FAQ
===

1. How to avoid the `AssertionFailed: The identifier was never assigned` error?

  This error is raised when you're asking to some component its `identifier` but it's not available (probably because the component was still not rendered). In case the rendering would happen at a later time and you have a canvas at hand, just tell the component to identify himself in it.

  For example
  ```smalltalk
  button onTrigger executeOnClient: [ :script :canvas |
            identifiedView identifyIn: canvas.
            script << (canvas jQuery id: identifiedView identifier) html: 'Loading...' ]
  ```
