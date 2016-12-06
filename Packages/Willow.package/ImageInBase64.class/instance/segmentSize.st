accessing - private
segmentSize

	"This is based on trying to use Fuel to serialize objects that contain base64 strings.
When using the whole string the image would crash (General Protection Fault?).
It was decided to create this class to partition the string and recombine it later as needed.
Up to 2048 characters there seems to be no problem.
Segments of size 2049 or more create the issue observed.
In order to leave room for unexpected future changes in Fuel, it is decided to use chunks of 512 characters."

	^ 512