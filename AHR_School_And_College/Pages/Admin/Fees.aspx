<%@ Page Title="Fees" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="AHR_School_And_College.Admin.Fees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="wrapper section position-relative">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="title">Monthly Fees Information</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex flex-wrap align-items-center justify-content-end">
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/addfee">Add Fee</a>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex flex-wrap align-items-center radius-5 radius-bottom-none b-1">

                    <div class="d-flex flex-column align-items-center justify-content-center">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="Label0" Text="Sort By" runat="server" />
                        <asp:ImageButton
                            CssClass="sort"
                            Visible="true"
                            ID="Desc"
                            OnClick="Desc_Click"
                            runat="server"
                            text="desc"
                            ImageUrl="~/image/sort-descending.png" />
                        <asp:ImageButton
                            CssClass="sort"
                            Visible="false"
                            OnClick="Asc_Click"
                            text="asc"
                            ID="Asc"
                            runat="server"
                            ImageUrl="~/image/sort-ascending.png" />
                    </div>
                    <div class="d-flex flex-column mb-2 px-2">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_0" Text="Class" runat="server" />

                        <asp:DropDownList
                            CssClass="input ms-0 my-0 "
                            ID="className"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            OnSelectedIndexChanged="className_SelectedIndexChanged"
                            name="class"
                            required="true"
                            runat="server">
                            <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                            <asp:ListItem Value="6">Six</asp:ListItem>
                            <asp:ListItem Value="7">Seven</asp:ListItem>
                            <asp:ListItem Value="8">Eight</asp:ListItem>
                            <asp:ListItem Value="9">Nine</asp:ListItem>
                            <asp:ListItem Value="10">Ten</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex flex-column mb-2 px-2">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_1" Text="Gender" runat="server" />

                        <asp:DropDownList
                            CssClass="input ms-0 my-0 "
                            ID="gender"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            name="gender"
                            OnSelectedIndexChanged="className_SelectedIndexChanged"
                            required="true"
                            runat="server">
                            <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex flex-column mb-2 px-2">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_3" Text="Fees Category" runat="server" />

                        <asp:DropDownList
                            CssClass="input ms-0 my-0 "
                            ID="Payment_Categories"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            OnSelectedIndexChanged="className_SelectedIndexChanged"
                            name="paymentCategories"
                            required="true"
                            runat="server">
                            <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                            <asp:ListItem Value="Admission">Admission Fees</asp:ListItem>
                            <asp:ListItem Value="Monthly">Monthly Fee</asp:ListItem>
                            <asp:ListItem Value="Exam">Exam Fee</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="d-flex flex-column mb-2 px-2">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_2" Text="Year" runat="server" />

                        <asp:TextBox
                            CssClass="input max-width-120 ms-0 my-0 "
                            ID="year"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            TextMode="Search"
                            OnTextChanged="year_TextChanged"
                            name="year"
                            Text="<%# DateTime.Now.Year.ToString() %>"
                            runat="server" />
                    </div>
                    <div class="d-flex flex-column mb-2 px-2 ms-auto">
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_21" Text="Search by ID" runat="server" />

                        <asp:TextBox
                            CssClass="input ms-0 my-0 "
                            ID="search_stId"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            TextMode="Search"
                            OnTextChanged="search_stId_TextChanged"
                            name="stId"
                            placeholder="Search by student ID"
                            runat="server" />
                    </div>


                </div>

                <div class="col-12 b-1 px-0">

                    <asp:GridView
                        ID="tData"
                        runat="server"
                        BorderColor="#cccccc"
                        BackColor="White"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellPadding="10"
                        Width="100%"
                        DataKeyNames="id"
                        AutoGenerateColumns="false"
                        OnRowUpdating="tData_RowUpdating"
                        OnRowDeleting="tData_RowDeleting"
                        >

                        <HeaderStyle BackColor="#006699" ForeColor="White" Font-Bold="false" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" ForeColor="White" />

                        <Columns>
                            <asp:TemplateField HeaderText="Pay ID">
                                <ItemTemplate>
                                    <asp:Image CssClass="radius-5 bdr-2-success" Width="35px" ID="lbl0" runat="server" ImageUrl='<%# Eval("image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pay ID">
                                <ItemTemplate>
                                    <asp:Label ID="lbl0" runat="server" Text='<%# Eval("id") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="payId" runat="server" Text='<%# Eval("id") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St. ID">
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" runat="server" Text='<%# Eval("stId") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Enabled="false" ID="stId" runat="server" Text='<%# Eval("stId") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbl2" runat="server" Text='<%# Eval("stName") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="stName" runat="server" Text='<%# Eval("stName") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="lbl3" runat="server" Text='<%# Eval("gender") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("gender") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Class">
                                <ItemTemplate>
                                    <asp:Label ID="lbl4" runat="server" Text='<%# Eval("class") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="className" runat="server" Text='<%# Eval("class") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Year">
                                <ItemTemplate>
                                    <asp:Label ID="lbl5" runat="server" Text='<%# Eval("year") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="year" runat="server" Text='<%# Eval("year") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fees Category">
                                <ItemTemplate>
                                    <asp:Label ID="lbl6" runat="server" Text='<%# Eval("payCat") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="payCat" runat="server" Text='<%# Eval("payCat") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fees Details">
                                <ItemTemplate>
                                    <asp:Label ID="lbl7" runat="server" Text='<%# Eval("payDes") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="payDes" runat="server" Text='<%# Eval("payDes") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fees">
                                <ItemTemplate>
                                    <asp:Label ID="lbl8" runat="server" Text='<%# Eval("fee") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="fee" runat="server" Text='<%# Eval("fee") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Payment Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl9" runat="server" Text='<%# DateTime.Parse(Eval("payDate").ToString()).ToString().Substring(0, Eval("payDate").ToString().Length - 12) %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label Enabled="false" ID="payDate" runat="server" Text='<%# Eval("payDate") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:ImageButton
                                        ID="Update"
                                        ImageUrl="~/image/edit.png"
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

                <div class="col-lg-8 col-md-8 mx-auto mt-2 mb-5 bg-light p-lg-5 p-md-3 radius-5 position-relative">
                    <div class="position-absolute cancel-top">
                        <asp:ImageButton CssClass="cancel-top-img" OnClick="cancel_Click" ImageUrl="~/image/stop.png" ToolTip="Cancel" ID="cancel" runat="server" />
                    </div>
                    <h3 class="text-center title">Update Payment Information</h3>
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-6">
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label1" Text="Payment ID" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_PayId"
                                    Enabled="false"
                                    runat="server"
                                    required="true"
                                    placeholder="Enter Your Name"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label2" Text="Student ID" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_stId"
                                    Enabled="false"
                                    runat="server"
                                    required="true"
                                    placeholder="Enter Your Name"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label3" Text="Student Name" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_stName"
                                    Enabled="false"
                                    runat="server"
                                    required="true"
                                    placeholder="Enter Your Name"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="form-label mb-0" ID="Label10" Text="Gender" runat="server" />

                                <asp:DropDownList
                                    CssClass="input form-control ms-0 my-0 "
                                    ID="up_gender"
                                    AutoPostBack="true"
                                    ClientIDMode="Static"
                                    name="class"
                                    Enabled="false"
                                    required="true"
                                    runat="server">
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="form-label mb-0" ID="Label4" Text="Class" runat="server" />

                                <asp:DropDownList
                                    CssClass="input form-control ms-0 my-0 "
                                    ID="up_className"
                                    AutoPostBack="true"
                                    ClientIDMode="Static"
                                    Enabled="false"
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
                        </div>
                        <div class="col-lg-6">
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label5" Text="Admissio Year" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_year"
                                    runat="server"
                                    Enabled="false"
                                    required="true"
                                    name="year" />
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
                                    <asp:ListItem Value="Admission">Admission Fees</asp:ListItem>
                                    <asp:ListItem Value="Monthly">Monthly Fee</asp:ListItem>
                                    <asp:ListItem Value="Exam">Exam Fee</asp:ListItem>
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label7" Text="Payment Description" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_payDes"
                                    runat="server"
                                    required="true"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label8" Text="Fees" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_fee"
                                    runat="server"
                                    TextMode="Number"
                                    required="true"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label9" Text="Payment Date" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_PayDate"
                                    Enabled="false"
                                    runat="server"
                                    required="true"
                                    name="payDate" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="d-flex flex-row flex-wrap gap-2 justify-content-center align-items-center p-4">
                        <asp:Button CssClass="btn btn-danger min-w-200" OnClick="Cancel_Information_Click" ID="Cancel_Information" Text="Cancel" runat="server" />
                        <asp:Button CssClass="btn btn-success min-w-200" OnClick="up_Payment_Informaion_Click" ID="up_Payment_Informaion" Text="Update" runat="server" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel Visible="false" CssClass="scroll-none container-fluid bg-transparent up-panel max-vh-100" ID="diabox" runat="server">
            <div class="row d-flex align-items-center justify-content-center bg-blur height-1000">
                <div class="dia-box m-auto">
                    <div class="d-flex flex-row justify-content-center align-items-center py-5">
                        <div>
                            
                        </div>
                        <p>Do You want to delete?</p>
                    </div>
                    <div class="d-flex align-items-center justify-content-center gap-3">
                        <asp:Button CssClass="btn btn-danger" ID="cnl" runat="server" OnClick="cnl_Click" Text="Cancel" />
                        <asp:Button CssClass="btn btn-secondary" OnClick="okay_Click" ID="okay" runat="server" Text="Okay" />
                        <asp:Label ID="perId" runat="server" Visible="false" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </section>
</asp:Content>
