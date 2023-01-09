<%@ Page Title="Notice" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="AHR_School_And_College.Notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="wrapper section">
            <asp:Panel 
                CssClass="container mb-3"
                ID="pnl_Notice_container1"
                runat="server"
                >
                <div class="row">
                    <div class="col-lg-9 mx-auto">
                        <h1 class="title">Notice</h1>
                    </div>
                </div>
                <div class="row">
                    <div>
                        <div class="col-lg-9 d-flex notice mx-auto">
                            <div class="col-10 notice-title">
                                <p class="lead mb-0 font-2">Notice Title</p>
                            </div>
                            <div class="col-2 download">
                                <p class="lead mb-0 font-2">Action</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="notic-box">

                        <asp:Repeater ID="Set_Notice" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-9 d-flex notice mx-auto">
                                    <div class="col-10 notice-title">
                                        <p class="lead mb-0 font-2">The School has spacious, well-equipped Physics, Chemistry, Biology and General Science Laboratories. Models, Specimen, Displays, Charts, Learning Kits, human skeleton, Audio-Visual Equipment, etc.</p>
                                    </div>
                                    <div class="col-2 download">
                                        <asp:ImageButton
                                            CssClass="download_btn"
                                            ID="btn_download"
                                            runat="server"
                                            ImageUrl="~/image/download.png"
                                            ImageAlign="Middle" Height="40" ClientIDMode="AutoID" ToolTip="Download" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Panel 
                            CssClass="notice-not-found"
                            ID="pnl_Notice"
                            runat="server"
                            >
                            <img src="image/no_search.png" alt="no_file" />
                            <div>
                                <h3 class="mb-0 sub-title f-dark-light text-center">No Notice Found</h3>
                                <p class="mb-0 font-2 f-dark-light text-center">please try another way.</p>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel 
                CssClass="container-fluid"
                runat="server"
                ID="pnl_Notice_container2">
                <div class="row">
                    <div class="col-12 d-flex flex-column justify-content-center align-content-center min-vh-75">
                        <img class="broken-img mx-auto radius-5" src="image/server-broken-2.jpg" alt="server broken" />
                        <div class="mt-3">
                            <h3 class="sub-title f-dark-light text-center  mb-0">
                                Something Broken
                            </h3>
                            <p class="text-center f-dark-light font-1">Please Try again later</p>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
