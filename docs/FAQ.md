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
