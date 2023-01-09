<%@ Page Title="Update Employee Information" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="AHR_School_And_College.Admin.EditEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="wrapper section">
        <div class="container">
            <div class="row">
                <h1 class="text-center title">Add New Employee</h1>
            </div>
            <div class="row">
                <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                    <div class="d-flex flex-column">
                        <label class="ps-2">Employee ID</label>
                        <asp:TextBox
                            CssClass="input mt-0"
                            ID="empId"
                            placeholder="Employee ID"
                            Enabled="false"
                            ClientIDMode="Static"
                            runat="server" />
                    </div>
                    <div class="d-flex flex-column">
                        <label class="ps-2">Employee Type</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="employeeType"
                            OnSelectedIndexChanged="employeeType_SelectedIndexChanged"
                            AutoPostBack="true"
                            runat="server"
                            placeholder="Select Religion">
                            <asp:ListItem Value="Teacher" Text="Teacher" />
                            <asp:ListItem Value="Principal" Text="Principal" />
                            <asp:ListItem Value="Others" Text="Others" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                    <div class="d-flex flex-column">
                        <label class="ps-2">Status</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="status"
                            OnSelectedIndexChanged="employeeType_SelectedIndexChanged"
                            runat="server"
                            placeholder="Select Religion">
                            <asp:ListItem Value="Active" Text="Active" />
                            <asp:ListItem Value="De-Active" Text="De-Active" />
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex flex-column">
                    <label class="ps-2">Joinning Date</label>
                    <asp:TextBox
                        CssClass="input mt-0"
                        ID="joiningDate"
                        placeholder="Joinning Date"
                        TextMode="Date"
                        ClientIDMode="Static"
                        runat="server" />
                </div>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                <div>
                    <h3 class="text-center sub-title">Personal Information</h3>
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
                        TextMode="Date"
                        ClientIDMode="Static"
                        runat="server" />
                </div>
                <div class="d-flex flex-column pt-2">
                    <label class="ps-2">Gender</label>
                    <asp:RadioButtonList
                        CssClass="gen"
                        ID="gender"
                        runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="row d-flex flex-row flex-lg-nowrap">
                    <div class="col-lg-6 d-flex flex-column">
                        <label class="ps-2">Religion</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="religion"
                            runat="server"
                            placeholder="Select Religion">
                            <asp:ListItem Value="Islam" Text="Islam" />
                            <asp:ListItem Value="Hindu" Text="Hindu" />
                            <asp:ListItem Value="Christian" Text="Christian" />
                            <asp:ListItem Value="Buddhist" Text="Buddhist" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-6 d-flex flex-column">
                        <label class="ps-2">Marrital Status</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="marritalStatus"
                            runat="server"
                            placeholder="Select Status">
                            <asp:ListItem Value="Married" Text="Married" />
                            <asp:ListItem Value="Single" Text="Single" />
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
            <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                <div>
                    <h3 class="sub-title text-center">Educational Information</h3>
                </div>
                <div class="d-flex flex-column">
                    <label class="ms-2">Qualification</label>
                    <asp:TextBox
                        CssClass="input mt-0"
                        ID="qualification"
                        runat="server"
                        placeholder="M.Sc 2012 / B.A Honours 2015 / M.Sc 2014" />
                </div>
                <asp:Panel ID="pnl_teacher" runat="server">
                    <div class="d-flex flex-column">
                        <label class="ms-2">Department</label>
                        <asp:TextBox
                            CssClass="input mt-0"
                            ID="department"
                            runat="server"
                            placeholder="Sciene / Humanities / Commerce / General" />
                    </div>
                    <div class="d-flex flex-column">
                        <label class="ms-2">Subject of Lecturer</label>
                        <asp:TextBox
                            CssClass="input mt-0"
                            ID="subOfLecturer"
                            runat="server"
                            placeholder="Physics, Cherimtry, Biology, Mathematics" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnl_others" runat="server">
                    <div class="d-flex flex-column">
                        <label class="ps-2">Employee Job Type</label>
                        <asp:DropDownList
                            CssClass="input mt-0"
                            ID="jobType"
                            runat="server"
                            placeholder="Select Religion">
                            <asp:ListItem Value="Clerk" Text="Clerk" />
                            <asp:ListItem Value="Security Guard" Text="Security Guard" />
                            <asp:ListItem Value="Night Guard" Text="Night Guard" />
                            <asp:ListItem Value="Office Assistent" Text="Office Assistent" />
                            <asp:ListItem Value="Sweeper" Text="Sweeper" />
                        </asp:DropDownList>
                    </div>
                </asp:Panel>
                <div class="d-flex flex-column">
                    <label class="ms-2">Monthly Salary</label>
                    <asp:TextBox
                        CssClass="input mt-0"
                        ID="monthlySalary"
                        runat="server"
                        TextMode="Number"
                        placeholder="15500" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                <div>
                    <h3 class="sub-title text-center">Contact Information</h3>
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
            </div>
            <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
                <div>
                    <h3 class="sub-title text-center">Mailling Information</h3>
                </div>
                <div class="d-flex flex-column">
                    <label class="ms-2">Present Address</label>
                    <asp:TextBox
                        CssClass="input mt-0"
                        ID="presentAddress"
                        runat="server"
                        placeholder="House No-1, Road No-2, Krishna Nagar, Keraniganj, Dhaka" />
                </div>
                <div class="d-flex flex-column">
                    <label class="ms-2">Permanent Address</label>
                    <asp:TextBox
                        CssClass="input mt-0"
                        ID="permanentAddress"
                        runat="server"
                        placeholder="House No-1, Road No-2, Krishna Nagar, Keraniganj, Dhaka" />
                </div>
            </div>

        </div>

        <div class="row mt-4">
            <div class="col-12 image-panel">
                <p>Image file to upload to the server:</p>
                <div class="image-box">
                    <img runat="server" class="image-box-img" id="up_img" src="../../image/gallery.png" alt="upload image" />

                </div>
                <input
                    id="oFile"
                    autopostback="false"
                    class="d-none"
                    onchange="imageUpload()"
                    type="file"
                    accept="image/*"
                    runat="server"
                    name="oFile">
                <label
                    class="btn btn-primary py-1 px-3"
                    for="admin_body_oFile">
                    Upload</label>
                <asp:Button
                    CssClass="d-none"
                    Type="button"
                    AutoPostBack="false"
                    ClientIDMode="Static"
                    OnClick="upload_image_Click"
                    ID="upload_image"
                    runat="server" />

            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12 p-2 d-flex">
                <asp:Button
                    OnClick="btn_Update_Click"
                    CssClass="btn px-4 py-1 btn-success btn1 mx-auto"
                    ID="btn_Update"
                    runat="server"
                    Text="Update" />
            </div>
        </div>
        </div>
        <script>

</script>
    </section>
</asp:Content>
