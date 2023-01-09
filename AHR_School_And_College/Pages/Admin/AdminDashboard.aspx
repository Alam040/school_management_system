<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="AHR_School_And_College.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="wrapper padding">

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="title ps-0">Dashboard</h1>
                </div>
            </div>
            <div class="row d-flex flex-row flex-wrap align-items-center justify-content-center bg-l mt-0">
                <div class=" col-6 col-md-4 col-lg-3">
                    <div class="b-1 d-flex flex-row justify-content-start width-100-percent position-relative radius-5 tot-p">
                        <div class="img-box box-1 d-flex">
                            <img class="dash-icon" runat="server" src="~/image/graduate-student-6368706-5250853.png" alt="icon" />
                            <div class="py-2 pe-1 ps-2 my-auto">
                                <h3 class="sub-title font-1 f-light mb-0">Total Student</h3>
                                <asp:Label ID="all" runat="server" class="sub-title f-light-blue-1 font-2 mb-0" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" col-6 col-md-4 col-lg-3">
                    <div class="b-1 d-flex flex-row justify-content-start width-100-percent position-relative radius-5 tot-g">

                        <div class="img-box box-2 d-flex align-items-center">
                            <img class="dash-icon" runat="server" src="~/image/sales-assistant-5691511-4741052.png" />
                            <div class="py-auto ps-2 width-100-percent">
                                <h3 class="sub-title font-1 f-light mb-0">Total Girls</h3>
                                <asp:Label ID="girl" runat="server" class="sub-title f-light-blue-1 font-2 mb-0" />

                            </div>
                        </div>
                    </div>
                </div>
                <div class=" col-6 col-md-4 col-lg-3 p-1">
                    <div class="b-1 d-flex flex-row justify-content-start width-100-percent position-relative radius-5 tot-b">
                        <div class="img-box box-3 d-flex align-items-centers">
                            <img class="dash-icon" runat="server" src="~/image/boy-avatar-6299533-5187865.png" />
                            <div class="py-auto ps-2 width-100-percent">
                                <h3 class="sub-title font-1 f-light mb-0">Total Boys</h3>
                                <asp:Label ID="boy" runat="server" class="sub-title f-light-blue-1 font-2 mb-0" />

                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class=" col-6 col-md-4 col-lg-3 p-1">
                    <div class="b-1 d-flex flex-row justify-content-start width-100-percent position-relative radius-5 tot-e">
                        <div class="img-box box-4 d-flex align-items-center">
                            <img class="dash-icon" runat="server" src="~/image/beard-man-4928324-4107700.png" />
                            <div class="py-auto ps-2 width-100-percent">
                                <h3 class="sub-title font-1 f-light mb-0">Total Employee</h3>
                                <h3 class="sub-title f-light-blue-1 font-2 mb-0">25</h3>

                            </div>
                        </div>
                    </div>
                </div>--%>

            </div>

        </div>
    </section>




    <section class="wrapper section pt-2">
        <div class="container">
            <div class="row radius-5 p-1 b-1">
                <h3 class="title">New Registrated Student</h3>
                <div class="col-12 d-flex flex-column gap-1 bt-0 py-2 px-0">
                    <asp:GridView
                        ID="tData"
                        runat="server"
                        BorderColor="#cccccc"
                        BackColor="White"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellPadding="10"
                        Width="100%"
                        DataKeyNames="stId"
                        AutoGenerateColumns="false">

                        <HeaderStyle BackColor="#006699" ForeColor="White" Font-Bold="false" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" ForeColor="White" />


                        <Columns>
                            
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image CssClass="radius-5 bdr-2-success" Width="35px" ID="img1" runat="server" ImageUrl='<%# Eval("image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="St. ID">
                                <ItemTemplate>
                                    <asp:Label ID="stId1" runat="server" Text='<%# Eval("stId") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="stId" runat="server" Text='<%# Eval("stId") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St. ID">
                                <ItemTemplate>
                                    <asp:Label ID="stName" runat="server" Text='<%# Eval("stName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date of Birth">
                                <ItemTemplate>
                                    <asp:Label ID="dob" runat="server" Text='<%# Eval("dob") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("gender") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="mob" runat="server" Text='<%# Eval("mobile") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Religion">
                                <ItemTemplate>
                                    <asp:Label ID="religion" runat="server" Text='<%# Eval("religion") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reg. Year">
                                <ItemTemplate>
                                    <asp:Label ID="year" runat="server" Text='<%# Eval("year") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Father's Name">
                                <ItemTemplate>
                                    <asp:Label ID="fname" runat="server" Text='<%# Eval("fName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mother's Name">
                                <ItemTemplate>
                                    <asp:Label ID="mname" runat="server" Text='<%# Eval("mName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label CssClass="max-width-120" ID="address" runat="server" Text='<%# Eval("address") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
