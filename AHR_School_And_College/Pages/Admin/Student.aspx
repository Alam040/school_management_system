<%@ Page Title="Student Information" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="AHR_School_And_College.Student" %>

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
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/newreg">New Registration</a>
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/newclass">New Class</a>
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/fees">Monthly Fees</a>
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/admit">Admited St</a>
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
                        ID="tData"
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
                            <%--<asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="img" ImageUrl='<%# Eval("image") %>' runat="server" Width="30px" Height="30px" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Image ID="img" ImageUrl='<%# Eval("image") %>' runat="server" Width="30px" Height="30px" />
                                </EditItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image CssClass="radius-5 bdr-2-success" Width="35px" ID="img1" runat="server" ImageUrl='<%# Eval("image") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="StID" runat="server" Text='<%# Eval("stId") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St.ID">
                                <ItemTemplate>
                                    <asp:Label ID="stId" runat="server" Text='<%# Eval("stId") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="StID" runat="server" Text='<%# Eval("stId") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St.Name">
                                <ItemTemplate>
                                    <asp:Label ID="stName" runat="server" Text='<%# Eval("stName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DoB">
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
                            <asp:TemplateField HeaderText="Session">
                                <ItemTemplate>
                                    <asp:Label ID="year" runat="server" Text='<%# Eval("year") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="F. Name">
                                <ItemTemplate>
                                    <asp:Label ID="fname" runat="server" Text='<%# Eval("fName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="M. Name">
                                <ItemTemplate>
                                    <asp:Label ID="mname" runat="server" Text='<%# Eval("mName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label CssClass="max-width-120" ID="address" runat="server" Text='<%# Eval("address") %>' />
                                </ItemTemplate>
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
                                <asp:Label ID="Label1" Text="Student ID" runat="server" />
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
                                    runat="server"
                                    required="true"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label30" Text="Date of Birth" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_dob"
                                    runat="server"
                                    TextMode="Date"
                                    required="true"
                                    name="stName" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label2" Text="Gender" runat="server" />
                                <asp:DropDownList
                                    CssClass="input ms-0 my-0 "
                                    ID="up_gender"
                                    AutoPostBack="true"
                                    ClientIDMode="Static"
                                    name="gender"
                                    required="true"
                                    runat="server">
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label22" Text="Religion" runat="server" />
                                <asp:DropDownList
                                    CssClass="input ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_religion"
                                    required="true"
                                    name="religion"
                                    runat="server">
                                    <asp:ListItem Value="Islam" Selected="True">Islam</asp:ListItem>
                                    <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                                    <asp:ListItem Value="Christian">Christian</asp:ListItem>
                                    <asp:ListItem Value="Buddhist">Buddhist</asp:ListItem>
                                </asp:DropDownList>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                        </div>





                        <div class="col-lg-6">

                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="lbl_6" Text="Father's Name" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_f_Name"
                                    runat="server"
                                    required="true"
                                    placeholder="Father's Name"
                                    name="f_Name" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="lbl_8" Text="Mothers's Name" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_m_Name"
                                    runat="server"
                                    required="true"
                                    placeholder="Mother's Name"
                                    name="m_Name" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="lbl_4" Text="Mobile No" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    ID="up_mobile"
                                    runat="server"
                                    required="true"
                                    placeholder="01812345678"
                                    MaxLength="11"
                                    TextMode="Phone"
                                    name="mobile" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="" ID="lbl_12" Text="Present Address" runat="server" />
                                <asp:TextBox
                                    CssClass="input form-control ms-0 my-0"
                                    ClientIDMode="Static"
                                    required="true"
                                    ID="up_presentAddress"
                                    runat="server"
                                    placeholder="Address"
                                    name="presentAddress" />
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                            <div class="d-flex flex-column mb-2">
                                <asp:Label ID="Label5" Text="Admission Year" runat="server" />
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

                        </div>
                    </div>
                    <div class="d-flex flex-row flex-wrap gap-2 justify-content-center align-items-center p-4">
                        <asp:Button CssClass="btn btn-danger min-w-200" OnClick="Cancel_Information_Click" ID="Cancel_Information" Text="Cancel" runat="server" />
                        <asp:Button CssClass="btn btn-success min-w-200" OnClick="up_Student_Informaion_Click" ID="up_Student_Informaion" Text="Update" runat="server" />
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
    <script>
        
    </script>
</asp:Content>
