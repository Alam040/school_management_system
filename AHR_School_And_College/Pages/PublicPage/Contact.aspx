<%@ Page Title="Contact" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AHR_School_And_College.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <%-- Contact Us  --%>
        <section class="wrapper section">
            <div class="container mb-5">
                <div class="row mb-3">
                    <div class="col-lg-6 mx-auto">
                        <h1 class="mt-2 mb-4 text-center">Contact with Us</h1>
                        <asp:Label CssClass="text-center" ID="notc" runat="server" />
                    </div>
                </div>
                <div class="row" data-aos="">
                    <div class="col-lg-7 px-5 mx-auto">
                        <div class="form">
                            <div class="d-flex flex-column">
                                <label class="ps-2 mb-0">Name</label>
                                <asp:TextBox CssClass="input mt-0" ID="tb_name" placeholder="Enter Name" name="name" runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Mobile</label>
                                <asp:TextBox CssClass="input mt-0" ID="tb_mobile" placeholder="01812345678" name="mob" MaxLength="11" TextMode="Phone" runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Email</label>
                                <asp:TextBox CssClass="input mt-0" ID="tb_email" placeholder="anyname@domain.com" TextMode="Email" name="email" runat="server" />
                            </div>
                            <div class="d-flex flex-column">
                                <label class="ps-2">Message</label>
                                <asp:TextBox CssClass="input mt-0" ID="tb_mag" Rows="5" placeholder="Write your message here." TextMode="MultiLine" name="msg" runat="server" />
                            </div>
                        </div>
                        <div class="form">
                            <asp:Button ID="btn_contact" OnClick="btn_contact_Click" Text="Submit" runat="server" class="btn-lg btn1 btn-large" />
                        </div>
                    </div>
                    <div class="col-lg-4 p-md-5 ps-5 mx-auto d-flex flex-column">
                        <h1 class="mb-5 title">Contact Address</h1>
                        <h1 class="title mb-0">Adhyapak Hamidur Rahman</h1>
                        <h3 class="font-2">School and College</h3>
                        <h3 class="font-1 mb-5 a-link mt-1 "><a class="a-link f-dark" href="https://www.google.com.bd/maps/dir//JCR7%2BG64+%E0%A6%85%E0%A6%A7%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%AA%E0%A6%95+%E0%A6%B9%E0%A6%BE%E0%A6%AE%E0%A6%BF%E0%A6%A6%E0%A7%81%E0%A6%B0+%E0%A6%B0%E0%A6%B9%E0%A6%AE%E0%A6%BE%E0%A6%A8+%E0%A6%B8%E0%A7%8D%E0%A6%95%E0%A7%81%E0%A6%B2+%E0%A6%85%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%A8%E0%A7%8D%E0%A6%A1+%E0%A6%95%E0%A6%B2%E0%A7%87%E0%A6%9C,+%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE%E0%A5%A4/@23.6411821,90.4178877,16.15z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3755bb9972e61e07:0xdf2d5765bddc1820!2m2!1d90.4130782!2d23.6412638?hl=en" target="_blank"><i class="fa-solid fa-location-dot me-2"></i>Keraniganj, Dhaka 1310</a></h3>
                        <a class="a-link f-dark mb-0" href="mailto:ahrsc@domain.com"><i class="fa-solid fa-envelope me-2"></i>ahrsc@domain.com</a>
                        <a class="a-link f-dark" href="tel:01812345678"><i class="fa-solid fa-phone me-2"></i>01812345678</a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
