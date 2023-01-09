<%@ Page Title="Students Login" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="AHR_School_And_College.StudentLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="wrapper section">
        <div class="container ">
            <div class="row ">
                <div class="col-lg-7 mx-auto">
                    <div class="position-relative col-lg-9 login-box mx-auto  d-flex flex-column m-auto min-vh-75">
                        <div class="back-btn">
                            <a class="a-link" runat="server" href="~/login"><i class="fa-solid fa-arrow-left"></i></a>
                        </div>
                        <h1 class=" text-center mt-4 mb-0">Login</h1>
                        <h3 class="sub-title text-center mb-2">Login Your Account</h3>
                        <div class="login-avatar-box mt-3">
                            <img runat="server" src="~/image/graduate-student-6368706-5250853.png" alt="avatar" />
                        </div>
                        <h3 class="sub-title text-center p-1 font-1 bg-success max-width-100 radius-5 f-light mx-auto mb-4">Student</h3>
                        <div class="input-group flex-nowrap my-2">
                            <span class="input-group-text radius-none" id="addon-wrapping radius-none"><i class="fa-solid fa-user"></i></span>
                            <asp:TextBox
                                CssClass="form-control radius-none"
                                ID="txt_id_s"
                                TextMode="Number"
                                placeholder="Student ID"
                                aria-label="Student ID"
                                aria-describedby="addon-wrapping"
                                TabIndex="1"
                                
                                runat="server" />
                        </div>
                        <div class="input-group flex-nowrap my-2">
                            <span class="input-group-text radius-none" id="addon-wrapping-pass"><i class="fa-solid fa-unlock-keyhole"></i></span>
                            <asp:TextBox
                                CssClass="form-control radius-none outline-0"
                                ID="txt_pass_s"
                                TextMode="Password"
                                placeholder="Password"
                                aria-label="Password"
                                aria-describedby="addon-wrapping-pass"
                                TabIndex="2"
                                runat="server" />
                        </div>
                        <div class="d-flex justify-content-between">
                            <div class="">
                                <asp:CheckBox CssClass="font-1 d-flex align-items-center gap-1" ID="ckb_1_s" runat="server" Text="Save Login" Checked="true" TabIndex="3"  />
                            </div>
                            <a tabindex="4" class="a-link f-dark font-1 text-right mb-2 pointer">forgot Password?</a>
                        </div>
                        <div class="d-flex align-items-center justify-content-center py-3 min-w-150 mb-5">
                            <asp:Button
                                CssClass="btn1 width-100-percent"
                                ID="student_login_submit"
                                runat="server"
                                TabIndex="5"
                                Type="submit"
                                Text="Login" />
                        </div>
                    <div class="position-absolute login-box-footer mx-auto">
                        <h3 class="sub-title font-1 text-center f-dark-light mb-0">Adhyapak Hamidur Rahman</h3>
                        <h3 class="sub-title font-1-2 text-center f-dark-light">School & College</h3>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
