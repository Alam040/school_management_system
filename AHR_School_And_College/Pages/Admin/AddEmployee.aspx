<%@ Page Title="Add Employee" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="AHR_School_And_College.Admin.AddEmployee" %>

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
                            <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:RadioButtonList>
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

                    <div class="d-flex flex-column">
                        <label class="ms-2">Subject of Lecturer</label>
                        <asp:TextBox
                            CssClass="input mt-0"
                            ID="subOfLecturer"
                            runat="server"
                            placeholder="Physics, Cherimtry, Biology, Mathematics" />
                    </div>


                </div>
                <div class="col-lg-5 d-flex flex-column radius-5 pb-4 pt-3 mx-auto mb-2">
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

                <div class="row mt-4">
                    <p class="text-center">Image file to upload to the server:</p>
                    <div class="d-flex flex-column justify-content-center align-items-center gap-1">
                        <div class="image-box mb-0">
                            <%--<img runat="server" class="needs-validation image-box-img image-box-img-1" id="up_img" src="~/image/gallery.png" alt="upload image" />--%>
                            <asp:Image
                                class="needs-validation image-box-img"
                                ID="up_st_img"
                                ImageUrl="~/image/gallery1.png"
                                runat="server" />
                        </div>
                        <div class="d-flex flex-column mb-2">
                            <asp:Label CssClass="font-1-2 f-red text-center mb-0" ID="lbl_img" runat="server" />
                            <asp:Label CssClass="font-1-2 f-red text-center" ID="lbl_img1" runat="server" />
                        </div>

                        <asp:FileUpload
                            ID="oFile"
                            class="d-none"
                            type="file"
                            accept="image/*"
                            runat="server" />

                        <label class="btn btn-primary py-1 px-3" autopostback="false" type="button" for="admin_body_oFile" id="btnUpload" runat="server">Upload</label>
                        <asp:Button
                            CssClass="btn btn-primary py-1 px-3 d-none"
                            ClientIDMode="Static"
                            ID="upload_image"
                            Text="Upload"
                            runat="server" />
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-12 p-2 d-flex">
                        <asp:Button
                            OnClick="btn_Submit_Click"
                            CssClass="btn px-4 py-1 btn-success min-w-300 mx-auto"
                            ID="btn_Submit"
                            runat="server"
                            Text="Submit" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        window.addEventListener("load", () => {

            document.querySelector('input[type="file"]').addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    var img = document.getElementById('admin_body_up_st_img');
                    img.onload = () => {
                        URL.revokeObjectURL(img.src);
                    }
                    img.src = URL.createObjectURL(this.files[0]);
                }
            })
        })
    </script>
</asp:Content>
