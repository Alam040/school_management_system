<%@ Page Title="Login" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AHR_School_And_College.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="wrapper section">
            <div class="container mt-2">
                <div class="row min-vh-75">
                    <div class="col-lg-7 m-auto">
                        <div class="col-12">
                            <h3 class="sub-title text-center mb-4">Select Login</h3>
                        </div>
                        <div class="col-12 d-flex align-items-center justify-content-center flex-wrap mx-auto gap-2">
                            <a href="~/login/student" runat="server" class="text-decoration-none f-dark">
                                <div class="login-card">
                                    <img src="image/student.jpg" />
                                    <h3 class="sub-title font-2">Student</h3>
                                </div>
                            </a>
                            <a href="~/login/teacher" runat="server" class="text-decoration-none f-dark">
                            <div class="login-card">
                                <img src="image/teacher-male.jpg" />
                                <h3 class="sub-title font-2">Teacher</h3>
                            </div>
                            </a>
                            <a href="~/login/admin" runat="server" class="text-decoration-none f-dark">
                            <div class="login-card">
                                <img src="image/protection.png" />
                                <h3 class="sub-title font-2">Admin</h3>
                            </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
