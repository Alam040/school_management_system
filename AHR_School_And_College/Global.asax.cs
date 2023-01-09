using Castle.Core.Resource;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Optimization;
using System.Web.UI;

namespace AHR_School_And_College
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
            RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        protected void RegisterRoutes(RouteCollection routes)
        {
            //Public Route

            routes.MapPageRoute("defaultRoute", "", "~/Pages/PublicPage/Home.aspx");
            routes.MapPageRoute("home", "home", "~/Pages/PublicPage/Home.aspx");
            routes.MapPageRoute("about", "about", "~/Pages/PublicPage/About.aspx");
            //routes.MapPageRoute("faculties", "faculties", "~/Pages/PublicPage/Faculties.aspx");
            //routes.MapPageRoute("admission", "admission", "~/Pages/PublicPage/Admission.aspx");
            routes.MapPageRoute("admission-newclass", "admission/newclass", "~/Pages/PublicPage/NewClassAdmission.aspx");
            routes.MapPageRoute("result", "result", "~/Pages/PublicPage/Result.aspx");
            //routes.MapPageRoute("notice", "notice", "~/Pages/PublicPage/Notice.aspx");
            routes.MapPageRoute("contact", "contact", "~/Pages/PublicPage/Contact.aspx");
            //routes.MapPageRoute("login", "login", "~/Pages/PublicPage/Login.aspx");
            //routes.MapPageRoute("login-student", "login/student", "~/Pages/PublicPage/StudentLogin.aspx");
            //routes.MapPageRoute("login-teacher", "login/teacher", "~/Pages/PublicPage/TeacherLogin.aspx");
            routes.MapPageRoute("login-admin", "login", "~/Pages/PublicPage/AdminLogin.aspx");

            // Admin Route

            routes.MapPageRoute("admin-dash", "admin/dashboard", "~/Pages/Admin/AdminDashboard.aspx");
            routes.MapPageRoute("admin-teacher", "admin/employees", "~/Pages/Admin/Employee.aspx");
            routes.MapPageRoute("admin-teacher-add", "admin/employees/addnew", "~/Pages/Admin/AddEmployee.aspx");
            routes.MapPageRoute("admin-student", "admin/students", "~/Pages/Admin/Student.aspx");
            routes.MapPageRoute("admin-new-reg", "admin/students/newreg", "~/Pages/Admin/NewRegistration.aspx");
            routes.MapPageRoute("admin-new-class", "admin/students/newclass", "~/Pages/Admin/NewClassReg.aspx");
            routes.MapPageRoute("admin-new-admited", "admin/students/admit", "~/Pages/Admin/AdmissionPanel.aspx");
            routes.MapPageRoute("admin-fees", "admin/students/fees", "~/Pages/Admin/Fees.aspx");
            routes.MapPageRoute("admin-fees-add", "admin/students/fees/addfee", "~/Pages/Admin/AddFees.aspx");
            routes.MapPageRoute("admin-result", "admin/result", "~/Pages/Admin/AddResult.aspx");
            routes.MapPageRoute("admin-more", "admin/more", "~/Pages/Admin/More.aspx");
            routes.MapPageRoute("admin-editEmployee", "admin/employees/edit/{id}", "~/Pages/Admin/EditEmployee.aspx");

            routes.LowercaseUrls = true;
            routes.RouteExistingFiles = true;
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
        }

        protected void RegisterBundles(BundleCollection bundles)
        {
            BundleTable.EnableOptimizations = true;
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));



            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));


            //bundles.Add(new ScriptBundle("~/bundles/boostrapJs").Include(
            //        "~/Scripts/bootstrap.js",
            //        "~/Scripts/all.min.js",
            //        "~/Scripts/app.js"
            //    ));
        }
    }
}