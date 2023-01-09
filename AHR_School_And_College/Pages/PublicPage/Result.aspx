<%@ Page Title="Result" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="AHR_School_And_College.Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <section class="wrapper section">
            <div class="container mt-1">
                <div class="result-box">
                    <div class="d-flex flex-column">
                        <img class="result-img" src="image/search-result.png" alt="result" />
                        <h1 class="text-center title">Search Result</h1>
                    </div>
                    <div class="">
                        <div class="d-flex flex-column">
                            <asp:Label ID="lbl_1" Text="Student ID" runat="server" />
                            <asp:TextBox
                                CssClass="input ms-0 mt-0"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                OnTextChanged="Handle_Change"
                                ID="txt_id"
                                runat="server"
                                TextMode="Number"
                                placeholder="220000"
                                name="stId" />
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="lbl_2" Text="Select Class" runat="server" />
                            <asp:DropDownList
                                CssClass="input ms-0 mt-0"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                OnTextChanged="Handle_Change"
                                ID="txt_class"
                                name="class"
                                runat="server">
                                <asp:ListItem Value="6" Selected="True">Six</asp:ListItem>
                                <asp:ListItem Value="7">Seven</asp:ListItem>
                                <asp:ListItem Value="8">Eight</asp:ListItem>
                                <asp:ListItem Value="9">Nine</asp:ListItem>
                                <asp:ListItem Value="10">Ten</asp:ListItem>
                                <asp:ListItem Value="11">Inter 1st Year</asp:ListItem>
                                <asp:ListItem Value="12">Inter 2nd Year</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="lbl3" Text="Exam Type" runat="server" />
                            <asp:DropDownList
                                CssClass="input ms-0 mt-0"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                OnTextChanged="Handle_Change"
                                ID="txt_exam"
                                name="exam"
                                runat="server">
                                <asp:ListItem Value="Pre-Half Yearly" Selected="True">Pre-Half Yearly</asp:ListItem>
                                <asp:ListItem Value="Half-Yearly">Half-Yearly</asp:ListItem>
                                <asp:ListItem Value="Pre-Test">Pre Test</asp:ListItem>
                                <asp:ListItem Value="Test">Test</asp:ListItem>
                                <asp:ListItem Value="Final">Final</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="lbl_3" Text="Year" runat="server" />
                            <asp:DropDownList
                                CssClass="input ms-0 mt-0"
                                AutoPostBack="true"
                                ClientIDMode="Static"
                                OnTextChanged="Handle_Change"
                                ID="txt_year"
                                name="year"
                                runat="server" />
                        </div>
                        <div class="p-3 d-flex">
                            <asp:Button 
                                CssClass="btn btn1 py-2 px-5 m-auto"
                                ID="result_Submit" 
                                Text="Submit" 
                                runat="server" 
                                />
                        </div>
                    </div>
                    <p class="title-name mb-0">Adyapak Hamidur Rahman School and College</p>
                    <p class="title-name mt-0">This System Collect Result from 2022</p>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
