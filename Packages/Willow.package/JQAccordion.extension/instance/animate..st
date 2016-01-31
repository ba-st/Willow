*Willow-Model-SeasideExtensions
animate: aBooleanOrNumberOrStringOrObject
	"Default: {} 
	If and how to animate changing panels.
	Multiple types supported:
	Boolean: A value of false will disable animations.
	Number: Duration in milliseconds with default easing.
	String: Name of easing to use with default duration.
	Object: Animation settings with easing and duration properties. 
	Can also contain a down property with any of the above options.
	'Down' animations occur when the panel being activated has a lower index than the currently active panel."

	self optionAt: 'animate' put: aBooleanOrNumberOrStringOrObject