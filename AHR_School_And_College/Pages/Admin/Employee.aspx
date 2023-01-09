<%@ Page Title="Employees Information" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="AHR_School_And_College.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="section wrapper">
        <div class="container-fluid px-4">
            <div class="row">
                <div class="col-12">
                    <h1 class="title">Employee's Information</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex flex-wrap align-items-center justify-content-end">
                    <a class="btn1 min-w-150" href="<%:Page.Request.Url %>/addnew">Add New</a>
                </div>
            </div>
            
            <div class="row radius-5 p-1">
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
                        <asp:Label CssClass="form-label mb-0 font-1-1" ID="lbl_21" Text="Search by ID" runat="server" />

                        <asp:TextBox
                            CssClass="input ms-0 ps-2 my-0"
                            ID="search_stId"
                            AutoPostBack="true"
                            ClientIDMode="Static"
                            TextMode="Search"
                            OnTextChanged="search_stId_TextChanged"
                            name="stId"
                            placeholder="Search by Employee ID"
                            runat="server" />
                    </div>
                </div>




                <div class="col-12 d-flex flex-column gap-1 b-1 bt-0 py-2 px-0">
                    <asp:GridView
                        ID="tEmpData"
                        runat="server"
                        BorderColor="#cccccc"
                        BackColor="White"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellPadding="10"
                        Width="100%"
                        OnRowUpdating="tData_RowUpdating"
                        OnRowDeleting="tData_RowDeleting"
                        DataKeyNames="empId"
                        ShowHeader="true"
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
                                <EditItemTemplate>
                                    <asp:Label ID="StID" runat="server" Text='<%# Eval("image") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Emp. ID">
                                <ItemTemplate>
                                    <asp:Label ID="empId1" runat="server" Text='<%# Eval("empId") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="empId" runat="server" Text='<%# Eval("empId") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="empName" runat="server" Text='<%# Eval("empName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DoB">
                                <ItemTemplate>
                                    <asp:Label ID="dob" runat="server" Text='<%# Eval("dob") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="mob" runat="server" Text='<%# Eval("mobile") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="sub" runat="server" Text='<%# Eval("subject") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="address" runat="server" Text='<%# Eval("address") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Salary">
                                <ItemTemplate>
                                    <asp:Label CssClass="max-width-120" ID="salary" runat="server" Text='<%# Eval("salary") %>' />
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
                    <h3 class="text-center title">Update Employee Information</h3>
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-6 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">

                            <div class="d-flex flex-column">
                                <label class="ps-2">Name</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="empId"
                                    placeholder="Employee Name"
                                    Enabled="false"
                                    ClientIDMode="Static"
                                    runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Name</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="empName"
                                    placeholder="Employee Name"
                                    ClientIDMode="Static"
                                    runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Date of Birth</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="dob"
                                    placeholder="Employee Name"
                                    ClientIDMode="Static"
                                    runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Gender</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="gender"
                                    ClientIDMode="Static"
                                    runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                        <label class="ps-2">Religion</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="religion"
                            runat="server"
                            placeholder="Select Religion">
                            <asp:ListItem Value="Islam" Text="Islam" Selected="True" />
                            <asp:ListItem Value="Hindu" Text="Hindu" />
                            <asp:ListItem Value="Christian" Text="Christian" />
                            <asp:ListItem Value="Buddhist" Text="Buddhist" />
                        </asp:DropDownList>
                    </div>
                            
                            

                        </div>
                        <div class="col-lg-6 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                            <div class="d-flex flex-column">
                                <label class="ms-2">Subject of Lecturer</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="subOfLecturer"
                                    runat="server"
                                    placeholder="Physics, Cherimtry, Biology, Mathematics" />
                            </div>

                            <div class="d-flex flex-column">
                                <label class="ms-2">Monthly Salary</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="monthlySalary"
                                    runat="server"
                                    TextMode="Number"
                                    placeholder="15500" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ms-2">Mobile</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="mobile"
                                    runat="server"
                                    TextMode="Phone"
                                    placeholder="01812345678" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ms-2">Email</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="email"
                                    runat="server"
                                    TextMode="Email"
                                    placeholder="something@email.com" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ms-2">Present Address</label>
                                <asp:TextBox
                                    CssClass="input mt-0"
                                    ID="presentAddress"
                                    runat="server"
                                    placeholder="House No-1, Road No-2, Krishna Nagar, Keraniganj, Dhaka" />
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
                <div class="dia-box m-auto">
                    <div class="d-flex flex-row justify-content-center align-items-center py-5">
                        <div>
                        </div>
                        <p>Do You want to De-Active?</p>
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
