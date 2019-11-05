<# 
Background jobs are different than scheduled tasks.  Tasks are run by 
the Task Scheduler service whether or not PowerShell is running and
do not require a user to be logged onto the computer.  A background
job, by contrast, is launched by PowerShell, runs as a part of a 
PowerShell session, and normally initiated by a logged on user.

Background jobs run hidden in the background of a PowerShell session.
After launching a background job, the PowerShell prompt becomes
immediately available to the user for executing new commands.  

Background jobs are useful for commands that require a long time to
complete, such as remoting to hundreds of other computers or copying
terabytes of files.  

Keep in mind that a background job is tied to a running instance
of PowerShell.  If you close PowerShell, any jobs associated with that
PowerShell session, running or finished, will be lost.  To run a
command which survives the termination of PowerShell or the logging
off of all users on a computer, use a scheduled task instead.

The Start-Job cmdlet and the -AsJob switch of Invoke-Command and
Get-WmiObject are the most common ways of launching background jobs.
The output produced by a job is obtained with the Receive-Job cmdlet.
#> 



# To run a command as a background job:
Start-Job -ScriptBlock { Test-Connection -ComputerName 'www.yahoo.com' -Count 50 } 


# To run a script as a background job:
Start-Job -FilePath .\SomeScript.ps1 


# To see what background jobs currently exist, running or otherwise:
Get-Job


# The details of a job include its run state, the command executed, name of the
# job, the ID number of the job, begin/end times, child jobs, errors, etc.  The
# output of a background job is actually contained in the child job(s).


# To see the details of a particular job by specifying job name or job ID number:
Get-Job -Name 'Job3' | Format-List *
Get-Job -Id 3 | Format-List *


# To see the child job(s) of a background job:
Get-Job -Id 3 | Select-Object -ExpandProperty ChildJobs | Format-List *


# To get the output produced by a background job and remove the data from the job object:
$Output = Receive-Job -Name 'Job3' 


# To get a job's output and REMOVE the data from the job afterwards:
$Output = Receive-Job -Name 'Job3' 


# Note: When a job is still running, you can receive its output so far and this action
# will not stop or pause the activities of the running job.  However, any data received 
# will be removed from the job object by default, unless you choose to -Keep it.


# To get a job's output and NOT remove the data from the job afterwards:
$Output = Receive-Job -Name 'Job3' -Keep


# To wait for a job to finish, holding the command prompt and blocking new commands until finished:
Wait-Job -Id 4     #You can use job ID or job name in all these examples.


# To wait for a job to finish, get its output, and delete the job object itself afterwards:
$Output = Receive-Job -Name 'Job3' -Wait -AutoRemoveJob


# To execute a set of commands or a script on multiple remote machines 
# as a background job, query the status of the job, then capture the
# output of the job (the commands on the machines) to a variable which
# includes the name of the target computer as a property on each object:
$Servers = @("Server7", "Server8", "Server9")
Invoke-Command -ComputerName $Servers -ScriptBlock { ps } -AsJob
Get-Job    #Query status, see the ID number, and look for State = Completed.
$Output = Receive-Job -ID 6    
$Output | Format-Table PSComputerName,ProcessName -AutoSize


# To see which commands support an -AsJob switch:
Get-Command -ParameterName AsJob | ft name



# Jobs can also be suspended, resumed, stopped and removed:
#   Suspend-Job, Resume-Job, Stop-Job, Remove-Job


