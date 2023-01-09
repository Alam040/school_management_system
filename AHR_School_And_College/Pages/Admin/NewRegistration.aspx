<%@ Page Title="New Student Registration" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="NewRegistration.aspx.cs" Inherits="AHR_School_And_College.Pages.Admin.NewRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="admin_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_body" runat="server">
    <section class="wrapper section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="p-2 mt-2 width-100-percent">
                        <a href="<%:Page.Request.Url.ToString().Substring(0, Page.Request.Url.ToString().Length - 6) %>newclass" class="btn1 py-2 px-3 ms-auto">New Class Admission</a>
                    </div>
                    <center>
                        <h1 class="title">Get New Admission</h1>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 col-md-10 col-sm-11 d-flex flex-column ms-lg-auto mx-md-auto mx-sm-auto">
                    <h3 class="sub-title text-center mt-2">Personal Information</h3>

                    <div class="d-flex flex-column mb-2">
                        <asp:Label ID="Label2" Text="Session" runat="server" />
                        <asp:TextBox
                            CssClass="input form-control ms-0 my-0"
                            ClientIDMode="Static"
                            Enabled="true"
                            ID="year"
                            TextMode="Search"
                            AutoCompleteType="Search"
                            AutoPostBack="true"
                            OnTextChanged="session_TextChanged"
                            runat="server"
                            required="true"
                            name="year" />
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="d-flex flex-column mt-2">
                        <asp:Label ID="lbl_3" Text="Gender" runat="server" />
                        <asp:RadioButtonList
                            CssClass="gen form-control"
                            ClientIDMode="Static"
                            OnSelectedIndexChanged="session_TextChanged"
                            AutoPostBack="true"
                            required="true"
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

                    <div class="d-flex flex-column">
                        <asp:Label ID="Label1" Text="Student ID" runat="server" />
                        <asp:TextBox
                            CssClass="input form-control ms-0 my-0 me-1"
                            Enabled="false"
                            ClientIDMode="Static"
                            ID="stID"
                            runat="server"
                            required="true"
                            name="stID" />
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>

                    <div class="d-flex flex-column mb-2">
                        <asp:Label CssClass="form-label mb-0" ID="lbl_0" Text="Admission for Class" runat="server" />

                        <asp:DropDownList
                            CssClass="input form-control ms-0 my-0 "
                            ID="className"
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
                        <asp:Label ID="lbl_1" Text="Name" runat="server" />
                        <asp:TextBox
                            CssClass="input form-control ms-0 my-0"
                            ClientIDMode="Static"
                            ID="stName"
                            runat="server"
                            required="true"
                            placeholder="Enter Your Name"
                            name="stName" />
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="d-flex flex-column mb-2">
                        <asp:Label ID="lbl_2" Text="Date of Birth" runat="server" />
                        <asp:TextBox
                            CssClass="input form-control ms-0 my-0"
                            ClientIDMode="Static"
                            ValidateRequestMode="Enabled"
                            ValidationGroup="h1"
                            ID="dob"
                            runat="server"
                            placeholder="Date of Birth"
                            required="true"
                            TextMode="Date"
                            name="dob" />
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="d-flex flex-column mb-2">
                        <asp:Label ID="lbl_5" runat="server" Text="Religion" />
                        <asp:DropDownList
                            CssClass="input form-control ms-0 my-0"
                            ClientIDMode="Static"
                            ID="religion"
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
                <div class="col-lg-5 col-md-10 col-sm-11 d-flex flex-column me-lg-auto mx-md-auto mx-sm-auto">
                    <h3 class="sub-title text-center mt-5 mt-lg-2">Parent's Information</h3>
                    <div class="d-flex flex-column mb-2">
                        <asp:Label ID="lbl_6" Text="Father's Name" runat="server" />
                        <asp:TextBox
                            CssClass="input form-control ms-0 my-0"
                            ClientIDMode="Static"
                            ID="f_Name"
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
                            ID="m_Name"
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
                            ID="mobile"
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
                            ID="presentAddress"
                            runat="server"
                            placeholder="Address"
                            name="presentAddress" />
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>

                    <div class="col-12 image-panel">
                        <p>Image file to upload to the server:</p>
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


                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12 p-2 d-flex">
                    <asp:Button
                        CssClass="btn min-w-300 px-4 py-2 btn-success btn1 mx-auto"
                        ID="btn_Submit"
                        ClientIDMode="Static"
                        OnClick="btn_Submit_Click"
                        runat="server"
                        Text="Submit" />
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">

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
