<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AddFees.aspx.cs" Inherits="AHR_School_And_College.Pages.Admin.AddFees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="wrapper section-m-vh-75">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="p-2 mt-2 width-100-percent">
                        <a href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length - 7) %>" class="btn1 py-2 px-3 ms-auto">Payment Table</a>
                    </div>
                    <center>
                        <h1 class="title">Get Payment</h1>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-5 col-md-10 col-sm-11 d-flex flex-column ms-lg-auto mx-md-auto mx-sm-auto">
                    <h3 class="sub-title text-center mt-2">Payment Information</h3>

                    <div class="d-flex flex-column mb-2">
                        <asp:Label ID="Label1" Text="Student ID" runat="server" />
                        <div class="d-flex flex-column">
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                Enabled="true"
                                ClientIDMode="Static"
                                ID="stID"
                                placeholder="Enter Student ID for Search"
                                TextMode="Number"
                                runat="server"
                                required="true"
                                name="stID" />
                        </div>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <asp:Label CssClass="font-1 f-red mt-2" ID="not_found" Text="" runat="server" />

                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="Label3" Text="Admission Year" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                Enabled="false"
                                ID="year"
                                runat="server"
                                required="true"
                                name="year" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-center p-4">
                            <asp:Button
                                CssClass="btn btn-primary"
                                ID="search_id"
                                OnClick="search_id_Click"
                                Text="Search"
                                runat="server" />
                        </div>
                    </div>







                    <asp:Panel ID="pnl" runat="server" Visible="false">
                        <div class="d-flex flex-column align-items-center justify-content-center mb-2">
                            <label class="text-center sub-title">Image</label>
                            <div class="image-box mb-0">
                                <asp:Image class="needs-validation image-box-img" ID="IMG" runat="server" />
                            </div>
                        </div>
                        
                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="Label2" Text="Student Name" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                Enabled="false"
                                ID="stName"
                                runat="server"
                                required="true"
                                name="year" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>

                        <div class="d-flex flex-column mb-2">
                            <asp:Label CssClass="form-label mb-0" ID="lbl_0" Text="Admission for Class" runat="server" />

                            <asp:DropDownList
                                CssClass="input form-control ms-0 my-0 "
                                ID="className"
                                AutoPostBack="true"
                                Enabled="false"
                                ClientIDMode="Static"
                                name="class"
                                required="true"
                                runat="server">
                                <asp:ListItem Value="6" Selected="True">Six</asp:ListItem>
                                <asp:ListItem Value="7">Seven</asp:ListItem>
                                <asp:ListItem Value="8">Eight</asp:ListItem>
                                <asp:ListItem Value="9">Nine</asp:ListItem>
                                <asp:ListItem Value="10">Ten</asp:ListItem>
                            </asp:DropDownList>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>

                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="lbl_11" Text="Gender" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="gender"
                                Enabled="false"
                                runat="server"
                                required="true"
                                name="stName" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>

                        <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="form-label mb-0" ID="Label6" Text="Payment Category" runat="server" />

                                <asp:DropDownList
                                    CssClass="input form-control ms-0 my-0 "
                                    ID="up_payCat"
                                    ClientIDMode="Static"
                                    name="paymentCategories"
                                    required="true"
                                    runat="server">
                                    <asp:ListItem Value="Tuition Fee">Tuition Fee</asp:ListItem>
                                    <asp:ListItem Value="Term Fess">Term Fee</asp:ListItem>
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="Label4" Text="Payment Description" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="payDes"
                                runat="server"
                                required="true"
                                placeholder="Admission/1st Term Exam/January"
                                name="stName" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>


                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="Label21" Text="Admission Fees" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="adFee"
                                runat="server"
                                placeholder="2000"
                                required="true"
                                name="fees" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <asp:Button
                                ID="Submit_Admission"
                                runat="server"
                                OnClick="Submit_Admission_Click"
                                Text="Submit"
                                CssClass="btn btn-success min-w-300 mx-auto my-3" />
                        </div>
                    </asp:Panel>
                </div>
            </div>

        </div>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12 d-flex flex-column align-items-center justify-content-center">
                    <h3 class="font-1 sub-title mt-5">Here you can apply for all Admited student payment.</h3>
                    <p class="font-1-1">
                        If you want to check payment table. Please click 
                            <a class="f-blue fa-1x" href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length - 7) %>">Here</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
