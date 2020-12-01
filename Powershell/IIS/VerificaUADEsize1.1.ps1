#
# Script para verificar sitio web www.uade.edu.ar
# Desarrollado por: Martín Ferrini
# Version: 1.1
# Mejora: Se le agrego una función en CSharp para poner timeout
# Última modificación: 30/06/2015
#

$Source = @"
	using System.Net;
 
	public class ExtendedWebClient : WebClient
	{
		public int Timeout;
 
		protected override WebRequest GetWebRequest(System.Uri address)
		{
			WebRequest request = base.GetWebRequest(address);
			if (request != null)
			{
				request.Timeout = Timeout;
			}
			return request;
		}
 
		public ExtendedWebClient()
		{
			Timeout = 100000; // the standard HTTP Request Timeout default
		}
	}
"@;
 
Add-Type -TypeDefinition $Source -Language CSharp  
 
$web = New-Object ExtendedWebClient;
$web.Timeout = 9000000;
$websites = Get-Content "C:\Tools\ScriptWeb\websites.txt"
ForEach ($webpage in $websites) {
$output = $web.DownloadString($webpage)
$peso = ($web.DownloadString($webpage)).length
    if ($peso -lt 100000) {
        $EmailSubject = "No Anda la web de UADE en " + $webpage
        Send-MailMessage -from "SCOM <SCOM@uade.edu.ar>" -to "Tecnologia <tecnologia@uade.edu.ar>" -subject $EmailSubject  -body $output -smtpServer aspmail.uade.edu.ar
        }
}