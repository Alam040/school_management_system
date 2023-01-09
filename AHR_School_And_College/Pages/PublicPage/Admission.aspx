<%@ Page Async="true" Title="Admission" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Admission.aspx.cs" Inherits="AHR_School_And_College.Admission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <section class="wrapper section">

            <div class="container">
                <div class="row" data-aos="fade-right">
                    <div class="col-12">
                        <div class="p-2 mt-2 width-100-percent">
                            <a href="<%:Page.Request.Url %>/newclass" class="btn1 py-2 px-3 ms-auto">New Class Admission</a>
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
                            <asp:Label CssClass="form-label mb-0" ID="lbl_0" Text="Admission for Class" runat="server" />

                            <asp:DropDownList
                                Enabled="false"
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
                        <div class="d-flex flex-column mt-2">
                            <asp:Label ID="lbl_3" Text="Gender" runat="server" />
                            <asp:RadioButtonList
                                CssClass="gen form-control"
                                ClientIDMode="Static"
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
                            <asp:Label ID="lbl_7" Text="Father's NID" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="f_Nid"
                                runat="server"
                                required="true"
                                placeholder="NID Number"
                                TextMode="Number"
                                name="f_Nid" />
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
                            <asp:Label ID="lbl_9" Text="Mothers's NID" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="m_Nid"
                                runat="server"
                                placeholder="NID Number"
                                TextMode="Number"
                                required="true"
                                name="m_Nid" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="lbl_10" Text="Legal Guardian Name" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="l_Guardian"
                                runat="server"
                                required="true"
                                placeholder="Legal Guardian Name"
                                name="l_Guardian" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                        <div class="d-flex flex-column mb-2">
                            <asp:Label ID="lbl_11" Text="Legal Guardian Mobile No" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="l_G_mobile"
                                runat="server"
                                MaxLength="11"
                                required="true"
                                TextMode="Phone"
                                placeholder="01812345678"
                                name="l_G_mobile" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-7 mx-auto">
                        <h3 class="sub-title text-center mx-auto">Mailing Address</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-10 col-sm-11 d-flex flex-column ms-lg-auto mx-md-auto mx-sm-auto">
                        <div class="d-flex flex-column mb-2">
                            <asp:Label CssClass="mt-5" ID="lbl_12" Text="Present Address" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                OnTextChanged="Handle_Change"
                                required="true"
                                ID="presentAddress"
                                onchange="Handle_Change()"
                                runat="server"
                                placeholder="Present Address"
                                name="presentAddress" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-10 col-sm-11 d-flex flex-column me-lg-auto mx-md-auto mx-sm-auto">
                        <div class="d-flex flex-column mb-2">
                            <%--  <asp:Label CssClass="mb-3" ID="lbl_125" runat="server">
                                Same Address
                            </asp:Label> --%>
                            <asp:CheckBox
                                CssClass="d-flex flex-row flex-nowrap mb-3 gap-2"
                                ID="ckd_same"
                                OnCheckedChanged="ckd_same_CheckedChanged"
                                Text="Same Address"
                                runat="server" />
                            <asp:Label ID="lbl_13" Text="Permanent Address" runat="server" />
                            <asp:TextBox
                                CssClass="input form-control ms-0 my-0"
                                ClientIDMode="Static"
                                ID="permanentAddress"
                                required="true"
                                runat="server"
                                placeholder="Permanent Address"
                                name="permanentAddress" />
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12 image-panel">
                        <p>Image file to upload to the server:</p>
                        <div class="d-flex flex-column justify-content-center align-items-center gap-1">
                            <div class="image-box mb-0">
                                <img runat="server" class="needs-validation image-box-img image-box-img-1" id="up_img" src="~/image/gallery.png" alt="upload image" />
                            </div>
                            <div class="d-flex flex-column mb-2">
                                <asp:Label CssClass="font-1-2 f-red text-center mb-0" ID="lbl_img" runat="server" />
                                <asp:Label CssClass="font-1-2 f-red text-center" ID="lbl_img1" runat="server" />
                            </div>
                        </div>
                        <input
                            id="oFile"
                            autopostback="false"
                            class="d-none form-control"
                            onchange="hangle_change_image()"
                            type="file"
                            required
                            accept="image/*"
                            runat="server"
                            name="oFile">
                        <label class="btn btn-primary py-1 px-3" autopostback="false" type="button" for="ContentPlaceHolder1_oFile" id="btnUpload" runat="server">Upload</label>
                        <asp:Button
                            CssClass="d-none"
                            Type="button"
                            AutoPostBack="false"
                            ClientIDMode="Static"
                            OnClick="handle_upload_image"
                            ID="upload_image"
                            runat="server" />

                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-12 p-2 d-flex">
                        <asp:Button
                            CssClass="btn min-w-200 px-4 py-2 btn-success btn1 mx-auto"
                            ID="btn_Submit"
                            runat="server"
                            OnClick="Handle_Submit"
                            Text="Submit" />
                    </div>
                </div>
            </div>

        </section>
    </main>
    <script>
        function Handle_Change() {
            const checkbox = document.getElementById("ContentPlaceHolder1_ckd_same");

            if (checkbox.checked == true) {
                let p = document.getElementById("presentAddress");
                let p2 = document.getElementById("permanentAddress");
                p.addEventListener("change", (e) => {
                    p2.value = e.target.value;
                })
            }
        }
    </script>
</asp:Content>
