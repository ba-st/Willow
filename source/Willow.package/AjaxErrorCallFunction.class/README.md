I'm a representation of an existing JS function that's invoked when an AJAX call fails. 
You just need to provide a function in your scripts called handleAjaxErrorCall receiving 3 parameters:
- the XMLHTTPRequest instance
- the textual description of the error
- the error thrown