using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication7
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["ziyaretci"] = 0;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            if ((int)Application["ziyaretci"] >-1)
            {
                int deger = (int)Application["ziyaretci"];
                deger += 1;
                Application["ziyaretci"] = deger;
            }
            Application.UnLock();
        }
        
        protected void Session_End(object sender, EventArgs e)
        {
            int deger =(int) Application["ziyaretci"];
            deger -= 1;
            Application["ziyaretci"] = deger;

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception CurEx = Server.GetLastError();
            //Data.ErrorLogging eLog = new Data.ErrorLogging();
            //eLog.LogYaz();
            //Server.ClearError();
        }




    }
}