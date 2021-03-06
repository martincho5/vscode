# The following is a list of common PowerShell modules
# which may be imported *IF* you have the necessary
# roles, features or software installed first.  Please
# search on the command lines below for documentation
# on prerequisites and installation.  In PowerShell 3.0
# and later, modules are usually loaded on-the-fly as
# needed so that explicit loading isn't normally required
# (a third-party module may require explicit loading).


# Microsoft Modules:
import-module WebAdministration
import-module ActiveDirectory
import-module ServerManager
import-module BitsTransfer
import-module GroupPolicy
import-module AppLocker
import-module ExpressionEncoder
Import-Module PSDiagnostics

# Microsoft SQL Server Modules:
import-module SQLServer
import-module Agent
import-module Repl
import-module SSIS
import-module SQLParser

# Third-Party Modules:
import-module PowerBoots


