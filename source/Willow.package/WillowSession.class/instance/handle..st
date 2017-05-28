handling
handle: aRequestContext

	"We override WARequestHandler because we want exactly the same: a way to access this session inside the execution of the request."

	CurrentWillowSession value: self during: [ super handle: aRequestContext ]