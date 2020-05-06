# Comments can come first, like these lines.
# So can blank lines, but "param" is next.

param ($computer = "localhost")

function pingwrapper ($ip) { ping.exe $ip }

pingwrapper -ip $computer 


