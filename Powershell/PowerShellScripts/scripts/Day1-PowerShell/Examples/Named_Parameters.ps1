# This creates the function, but does not run it!

function list-parameters ($User, $Password) 
{
	$User.ToUpper()
	$Password.ToLower()
}






# You have to call or execute a function for it to run!

list-parameters Jill Sekrit

list-parameters -user Jill Sekrit

list-parameters -user Jill -password Sekrit

list-parameters -u Jill -p Sekrit

list-parameters -password Sekrit -user Jill

