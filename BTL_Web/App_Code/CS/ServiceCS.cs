using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ServiceCS
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ServiceCS : System.Web.Services.WebService
{

    public ServiceCS()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string GetDetails(string name, int age)
    {
        return string.Format("Name: {0}{2}Age: {1}{2}TimeStamp: {3}", name, age, Environment.NewLine, DateTime.Now.ToString());
    }
}
