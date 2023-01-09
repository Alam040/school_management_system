<%@ Page Title="New Class Admission" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="NewClassAdmission.aspx.cs" Inherits="AHR_School_And_College.Pages.PublicPage.NewClassAdmission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="wrapper section">
        <div class="container">
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="p-2 mt-2 width-100-percent">
                        <a runat="server" href="~/admission" class="btn1 py-2 px-3 ms-auto">New Registration</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 mx-auto d-flex flex-column mb-5 b-1 radius-5 pb-5 pt-3 px-4">
                    <h3 class="title text-center">New Class Registration</h3>
                    <div class="d-flex flex-column mb-2">
                        <asp:Label CssClass="font-1" ID="lbl_1" Text="Student ID" runat="server" />
                        <div class="input-group mb-3">
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0 me-0"
                                ClientIDMode="Static"
                                ID="stId"
                                aria-label="Search Student ID" aria-describedby="search"
                                runat="server"
                                required="true"
                                TextMode="Number"
                                placeholder="Search Student ID"
                                name="stId" />
                            <asp:Button
                                CssClass="b-1 px-4 btn btn-success"
                                ID="search"
                                ClientIDMode="Static"
                                runat="server"
                                OnClick="search_Click"
                                Text="Search" />
                        </div>
                        <asp:Panel ID="pnl_newClass" runat="server">
                            <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="font-1" ID="Label1" Text="Student Name" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="stName"
                                    runat="server"
                                    required="true"
                                    Enabled="false"
                                    placeholder="Enter Your Name"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mt-2">
                                <asp:Label CssClass="font-1" ID="lbl_3" Text="Gender" runat="server" />
                                <asp:RadioButtonList
                                    CssClass="gen form-control ms-0 gen-mb-0"
                                    ClientIDMode="Static"
                                    required="true"
                                    Enabled="false"
                                    ID="gender"
                                    runat="server">
                                    <asp:ListItem Value="Male" Selected="True" Text="Male" />
                                    <asp:ListItem Value="Female" Text="Female" />
                                    <asp:ListItem Value="Other" Text="Other" />
                                </asp:RadioButtonList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mt-2">
                                <label class="font-1">Admission Class</label>
                                <asp:DropDownList CssClass="input form-control ms-0 mt-0 pointer" ID="ddl_class" runat="server" required="true">
                                    <asp:ListItem Value="7" Text="Seven" Selected="True" />
                                    <asp:ListItem Value="8" Text="Eight" />
                                    <asp:ListItem Value="9" Text="Nine" />
                                    <asp:ListItem Value="10" Text="Ten" />
                                    <asp:ListItem Value="11" Text="Inter 1st Year" />
                                    <asp:ListItem Value="12" Text="Inter 2nd Year" />
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mt-2">
                                <label class="font-1">Year</label>
                                <asp:DropDownList CssClass="input form-control ms-0 mt-0 pointer" ID="ddl_year" runat="server" required="true">
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mt-5">
                                <asp:Button
                                    CssClass="btn1 min-w-200 px-4 py-2 mx-auto"
                                    ID="submit_admission"
                                    runat="server"
                                    OnClick="submit_admission_Click"
                                    Text="Submit" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
