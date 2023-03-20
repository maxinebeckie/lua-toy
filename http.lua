-- the simplest HTTP connection. Takes one argument, the url to connect to.
url = arg[1]
local http = require("socket.http")
local body, code, headers, status = http.request(url)

-- the # operator in lua returns the length of a string or metatable. 
print(code, status, #body)