<%@ Page Title="Faculties" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Faculties.aspx.cs" Inherits="AHR_School_And_College.Faculties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="wrapper section">
            <asp:Panel 
                CssClass="container mt-2"
                runat="server"
                ID="pnl_Faculties_container1">
                <div class="row">
                    <div class="col-lg-6 mx-auto">
                        <h1 class="title text-center">All Faculties Teachers</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7 mb-3 mx-auto d-flex gap-c-1 flex-wrap align-items-center justify-content-center">
                        <asp:Button
                            CssClass=" btn1 px-0 min-w-100 font-1 me-0 mb-0"
                            ID="btn_all"
                            runat="server"
                            Text="All"
                            OnClick="Get_All_Employee" />
                        <asp:Button
                            CssClass="btn1 px-0 min-w-100 font-1 me-0 mb-0"
                            ID="btn_science"
                            runat="server"
                            Text="Science"
                            OnClick="Get_Science_Emp" />
                        <asp:Button
                            CssClass="btn1 px-0 min-w-100 font-1 me-0 mb-0"
                            ID="btn_Humanities"
                            runat="server"
                            Text="Humanities"
                            OnClick="Get_Humanities_Emp" />
                        <asp:Button
                            CssClass="btn1 px-0 min-w-100 font-1 me-0 mb-0"
                            ID="btn_Commerce"
                            runat="server"
                            Text="Commerce"
                            OnClick="Get_Commerce_Emp" />
                        <asp:Button
                            CssClass="btn1 px-0 min-w-100 font-1 me-0 mb-0"
                            ID="btn_General"
                            runat="server"
                            Text="General"
                            OnClick="Get_General_Emp" />
                    </div>

                </div>
                <div class="row">
                    <div class="d-flex gap-1 flex-wrap faculty">
                        <asp:Repeater ID="facultiesTeacher" runat="server">
                            <ItemTemplate>
                                <div class="card card-width" data-aos="">
                                    <div class="card-img-rel">
                                        <img class="img-abs" src="<%#Eval("image") %>" alt="<%#Eval("jobType") %>" />
                                        <h5 class="card-title p-name"><%#Eval("empName") %></h5>
                                        <p class="job-type"><%#Eval("jobType") %></p>
                                    </div>
                                    <div class="card-body mb-3 mt-5">
                                        <p class="card-text mb-0 dept">
                                            <i class="fa-solid fa-school me-2"></i>
                                            <%#Eval("department") %>
                                        </p>
                                        <p class="card-text mb-0">
                                            <i class="fa-solid fa-book me-2"></i>
                                            <%#Eval("subOfLecturer") %>
                                        </p>
                                        <p class="card-text mb-0">
                                            <i class="fa-regular fa-hourglass-half me-2"></i>
                                            <%#
                                            ((((DateTime.Now.Year - DateTime.Parse(Eval("joiningDate").ToString()).Year) * 12) + (DateTime.Now.Month - DateTime.Parse(Eval("joiningDate").ToString()).Month)) / 12).ToString()
                                            %>
                                        Years of Experience
                                        </p>
                                        <a href="tel:<%#Eval("mobile") %>" class="card-text mb-0 a-link f-dark">
                                            <i class="fa-solid fa-phone me-2"></i><%#Eval("mobile") %>
                                        </a>
                                        <a href="mailto:<%#Eval("email") %>" class="card-text a-link f-dark">
                                            <i class="fa-solid fa-envelope me-2"></i><%#Eval("email") %>

                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Panel 
                           CssClass="col-12 gap-1 flex-wrap emp-not-found "
                            ID="pnl_Faculties" 
                            runat="server">
                            <img class="no-res-img" src="image/no_result.gif" alt="Not Fount" />
                            <div>
                                <h1 class="sub-title f-dark-light text-center mb-0">No Result Found</h1>
                                <p class="lead font-1 text-center f-dark-light mb-0">We didn't find any Results</p>
                                <p class="lead text-center font-1 f-dark-light">matching your search</p>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel 
                CssClass="container-fluid"
                runat="server"
                ID="pnl_faculties_container2">
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
