<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdmissionPanel.aspx.cs" Inherits="AHR_School_And_College.Pages.Admin.AdmissionPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="section wrapper">
        <div class="container-fluid px-4">
            <div class="row">
                <div class="col-12">
                    <h1 class="title">Student Information</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex flex-wrap align-items-center justify-content-end">
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length-6) %>/newreg">New Registration</a>
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length-6) %>/newclass">New Class</a>
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length-6) %>/fees">Monthly Fees</a>
                </div>
            </div>
            <div class="row radius-5 p-1">
                <div class="col-12 d-flex flex-wrap align-items-center radius-5 radius-bottom-none b-1">
                    <div class="tool">
                        <div class="d-flex flex-column align-items-center justify-content-center">
                            <asp:Label CssClass="form-label mb-0 font-1-1" ID="Label0" Text="Sort By" runat="server" />
                            <asp:ImageButton
                                CssClass="sort"
                                Visible="true"
                                ID="Desc"
                                OnClick="Desc_Click1"
                                runat="server"
                                text="desc"
                                ImageUrl="~/image/sort-descending.png" />
                            <asp:ImageButton
                                CssClass="sort"
                                Visible="false"
                                OnClick="Asc_Click1"
                                text="asc"
                                ID="Asc"
                                runat="server"
                                ImageUrl="~/image/sort-ascending.png" />
                        </div>

                        <div class="d-flex flex-column mb-2 px-2">
                            <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_1" Text="Gender" runat="server" />

                            <asp:DropDownList
                                CssClass="input-1 ms-0 my-0 "
                                ID="gender"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                name="gender"
                                OnSelectedIndexChanged="gender_SelectedIndexChanged"
                                required="true"
                                runat="server">
                                <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="d-flex flex-column mb-2 px-2 year">
                            <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_2" Text="Year" runat="server" />

                            <asp:TextBox
                                CssClass="input-1 max-width-120 ms-0 my-0 "
                                ID="year"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                TextMode="Search"
                                OnTextChanged="year_TextChanged1"
                                name="year"
                                runat="server" />
                        </div>
                    </div>
                    <div class="d-flex flex-column mb-2 px-2 ms-auto search">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_21" Text="Search by ID" runat="server" />

                        <asp:TextBox
                            CssClass="input-1 ms-0 my-0"
                            ID="search_stId"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            TextMode="Search"
                            OnTextChanged="search_stId_TextChanged1"
                            name="stId"
                            placeholder="Search by student ID"
                            runat="server" />
                    </div>


                </div>

                <div class="col-12 d-flex flex-column gap-1 b-1 bt-0 py-2 px-0">
                    <asp:GridView
                        ID="tAdmData"
                        runat="server"
                        BorderColor="#cccccc"
                        BackColor="White"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellPadding="10"
                        Width="100%"
                        OnRowUpdating="tData_RowUpdating"
                        OnRowDeleting="tData_RowDeleting"
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
                            <asp:TemplateField HeaderText="St.ID">
                                <ItemTemplate>
                                    <asp:Label ID="stId" runat="server" Text='<%# Eval("stId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St.Name">
                                <ItemTemplate>
                                    <asp:Label ID="stName" runat="server" Text='<%# Eval("stName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("gender") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Class">
                                <ItemTemplate>
                                    <asp:Label ID="year" runat="server" Text='<%# Eval("class") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Adm. Year">
                                <ItemTemplate>
                                    <asp:Label ID="admyear" runat="server" Text='<%# Eval("year") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:ImageButton
                                        ID="Update"
                                        ImageUrl="~/image/preview-1.png"
                                        Width="20px"
                                        Height="20px"
                                        CommandName="Update"
                                        ToolTip="Edit"
                                        runat="server" />
                                    <asp:ImageButton
                                        ID="Delete"
                                        ImageUrl="~/image/trash.png"
                                        Width="20px"
                                        Height="20px"
                                        CommandName="Delete"
                                        ToolTip="Delete"
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>



        <asp:Panel Visible="false" CssClass="container-fluid bg-transparent up-panel" runat="server" ID="editPnl">
            <div class="row bg-blur max-vh-100">
                <div class="col-lg-6 col-md-8 mx-auto mt-2 mb-5 bg-light p-lg-5 p-md-3 radius-5 position-relative">
                    <div class="position-absolute cancel-top">
                        <asp:ImageButton CssClass="cancel-top-img" OnClick="cancel_Click" ImageUrl="~/image/stop.png" ToolTip="Cancel" ID="cancel" runat="server" />
                    </div>
                    <h3 class="text-center title">Preview Student Information</h3>
                    <div class="row">
                        <div class="col-11 d-flex flex-column ms-lg-auto mx-md-auto mx-sm-auto">
                            
                            <div class="d-flex flex-column align-items-center justify-content-center mb-2">
                                <label class="text-center sub-title">Image</label>
                                <div class="image-box mb-0">
                                    <asp:Image class="needs-validation image-box-img" ID="IMG" runat="server" />
                                </div>
                            </div>

                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label1" Text="Student ID" runat="server" />
                                <div class="d-flex flex-column">
                                    <asp:TextBox
                                        CssClass="input form-control ms-0 my-0"
                                        Enabled="false"
                                        ClientIDMode="Static"
                                        ID="up_stID"
                                        placeholder="Enter Student ID for Search"
                                        runat="server"
                                        required="true"
                                        name="stID" />
                                </div>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label2" Text="Student Name" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    Enabled="false"
                                    ID="Up_stName"
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
                                    ID="up_className"
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
                                <asp:Label CssClass="font-1 f-red mt-2" ID="not_found" Text="" runat="server" />

                                <div class="d-flex flex-column mb-2">
                                    <asp:Label ID="Label3" Text="Admission Year" runat="server" />
                                    <asp:TextBox
                                        CssClass="input form-control ms-0 my-0"
                                        ClientIDMode="Static"
                                        Enabled="false"
                                        ID="up_year"
                                        runat="server"
                                        required="true"
                                        name="year" />
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="lbl_11" Text="Gender" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_gender"
                                    Enabled="false"
                                    runat="server"
                                    required="true"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="d-flex flex-row flex-wrap gap-2 justify-content-center align-items-center p-4">
                        <asp:Button CssClass="btn btn-danger min-w-200" OnClick="Cancel_Information_Click" ID="Cancel_Information" Text="Cancel" runat="server" />
                        <%--<asp:Button CssClass="btn btn-success min-w-200" OnClick="up_Student_Informaion_Click" ID="up_Student_Informaion" Text="Update" runat="server" />--%>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel Visible="false" CssClass="scroll-none container-fluid bg-transparent up-panel max-vh-100" ID="diabox" runat="server">
            <div class="row d-flex align-items-center justify-content-center bg-blur height-1000">
                <div class="dia-box m-auto pb-3">
                    <div class="d-flex flex-row justify-content-center align-items-center pt-5 pb-4">
                        <div>
                        </div>
                        <p class="font-1">Do You want to De-Active All Information?</p>
                    </div>
                    <div class="d-flex align-items-center justify-content-center gap-3">
                        <asp:Button CssClass="btn btn-danger" ID="cnl" runat="server" OnClick="cnl_Click" Text="Cancel" />
                        <asp:Button CssClass="btn btn-primary px-4" OnClick="okay_Click" ID="okay" runat="server" Text="Okay" />
                        <asp:Label ID="perId" runat="server" Visible="false" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </section>
</asp:Content>
