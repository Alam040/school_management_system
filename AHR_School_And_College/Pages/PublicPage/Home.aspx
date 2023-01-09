<%@ Page Title="Home" Language="C#" MasterPageFile="~/PublicSite.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AHR_School_And_College.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <%-- Hero-Section --%>
        <section class="wrapper">
            <div class="container-fluid hero-bg">
                <div class="row" data-aos="fade-right">
                    <div class=" info-container">
                        <div class="info">
                            <h1>Adhyapak Hamidur Rahman</h1>
                            <h3>School and College</h3>
                            <p><i class="fa-solid fa-location-dot me-2"></i>South-Keraniganj, Dkaha</p>
                            <a class="a-link f-light" href="tel:01812345678"><i class="fa-solid fa-phone me-2"></i>01812345678</a>
                            <a class="a-link f-flight" href="mailto:ahrsc@domain.com"><i class="fa-solid fa-envelope me-2"></i>ahrsc@domain.com</a>

                            <div class="d-flex action-box">
                                <a class="btn1" runat="server" href="~/about">About More</a>
                                <%--<a class="btn1 get-admit" runat="server" href="~/admission">Get Admission</a>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%-- Facilities --%>

        <section class="wrapper">
            <div class="container mt-5">
                <div class="row" data-aos="">
                    <div class="col-lg-7 p-4 mx-auto" data-aos="">
                        <center>
                            <h1 class="location-title">Why Study in our Institution?</h1>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 line-card-group">
                        <div class="line-card" data-aos="">
                            <div class="line-card-img s-lab">
                                <img class="l-card-img-w" src="image/laboratory.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Science Laboratories</h3>
                                <p>The School has spacious, well-equipped Physics, Chemistry, Biology and General Science Laboratories. Models, Specimen, Displays, Charts, Learning Kits, human skeleton, Audio-Visual Equipment, etc.</p>
                            </div>
                        </div>
                        <div class="line-card" data-aos="">
                            <div class="line-card-img ict-lab">
                                <img class="l-card-img-w" src="image/desktop-computer.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>ICT Laboratories</h3>
                                <p>Information and Communication Technology (ICT), The School have ICT lab which consist of 36 laptops for students.</p>
                            </div>
                        </div>
                        <div class="line-card" data-aos="">
                            <div class="line-card-img tutor">
                                <img class="l-card-img-w" src="image/elearning.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Hight Experienced Tutors</h3>
                                <p>We have some of the best tutors within the education sector whom deliver engaging lessons to our students.</p>
                            </div>
                        </div>
                        <div class="line-card" data-aos="">
                            <div class="line-card-img security">
                                <img class="l-card-img-w" src="image/insurance.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Tight Security</h3>
                                <p>The Institution has a well maintained with the required safety measures that include CCTV surveillance.</p>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6 line-card-group">
                        <div class="line-card" data-aos="">
                            <div class="line-card-img library">
                                <img class="l-card-img-w" src="image/books-library.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Library</h3>
                                <p>Our library has a large range of engaging fiction, non-fiction, and picture story books. All classes have a timetabled weekly library lesson in the library taken by the class teacher or library teacher.</p>
                            </div>
                        </div>
                        <div class="line-card" data-aos="">
                            <div class="line-card-img canteen">
                                <img class="l-card-img-w" src="image/cafeteria.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Canteen</h3>
                                <p>The school canteen offers a range of healthy snacks and beverages served throughout the day.</p>
                            </div>
                        </div>
                        
                        <div class="line-card" data-aos="">
                            <div class="line-card-img shift">
                                <img class="l-card-img-w" src="image/clock.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>2-Shift Class</h3>
                                <p>We study girls and boys separately in two shift, Morning Shift and Day-Shift. Morning-Shift for girls and Day-shift for Boys.</p>
                            </div>
                        </div>
                        <div class="line-card" data-aos="">
                            <div class="line-card-img play-ground">
                                <img class="l-card-img-w" src="image/playground.png" alt="Icon" />
                            </div>
                            <div class="line-card-body">
                                <h3>Playground</h3>
                                <p>For the improvement of physical and mental health, sports facilities are the most important aspects that parents need to consider before they admit their children to any school.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <%-- Faculties Teacher's --%>
        <section class="wrapper">
            <div class="container">
                <div class="row mt-2">
                    <div class="col-9 mx-auto" data-aos="">
                        <center>
                            <h1 class="faculty-title">Meet with our Faculties Teacher</h1>
                            <p></p>
                        </center>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="d-flex gap-3 flex-wrap faculty">
                        <asp:Repeater ID="faculties" runat="server">
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:Repeater>


                        <div class="col-md-5 col-lg-3 col-sm-7 m-4">
                            <div class="card card-width" data-aos="">
                                <div class="card-img-rel">
                                    <img class="img-abs" src="image/man.png" alt="Principal" />
                                    <h5 class="card-title p-name">Jahangir Alam</h5>
                                    <p class="job-type">Principal</p>
                                </div>
                                <div class="card-body mb-3 mt-5">
                                    <p class="card-text mb-0">Department : General</p>
                                    <p class="card-text mb-0">Subject : English</p>
                                    <p class="card-text mb-0">Joining Date : 2022-02-25</p>
                                    <a href="tel:01812345678" class="card-text mb-0 a-link f-dark">Mobile : 01812345678</a>
                                    <a href="mailto:myname@domain.com" class="card-text a-link f-dark">E-mail : myname@domain.com</a>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-5 col-lg-3 col-sm-7 m-4">
                            <div class="card card-width" data-aos="">
                                <div class="card-img-rel">
                                    <img class="img-abs" src="image/man-2.png" alt="Teacher" />
                                    <h5 class="card-title p-name">Jahangir Alam</h5>
                                    <p class="job-type">Teacher</p>
                                </div>
                                <div class="card-body mb-3 mt-5">
                                    <p class="card-text mb-0">Department : General</p>
                                    <p class="card-text mb-0">Subject : English</p>
                                    <p class="card-text mb-0">Joining Date : 2022-02-25</p>
                                    <a href="tel:01812345678" class="card-text mb-0 a-link f-dark">Mobile : 01812345678</a>
                                    <a href="mailto:myname@domain.com" class="card-text a-link f-dark">E-mail : myname@domain.com</a>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-5 col-lg-3 col-sm-7 m-4">
                            <div class="card card-width animate__backInDown" data-aos="">
                                <div class="card-img-rel">
                                    <img class="img-abs" src="image/man-4.png" alt="Teacher" />
                                    <h5 class="card-title p-name">Jahangir Alam</h5>
                                    <p class="job-type">Teacher</p>
                                </div>
                                <div class="card-body mb-3 mt-5">
                                    <p class="card-text mb-0">Department : General</p>
                                    <p class="card-text mb-0">Subject : English</p>
                                    <p class="card-text mb-0">Joining Date : 2022-02-25</p>
                                    <a href="tel:01812345678" class="card-text mb-0 a-link f-dark">Mobile : 01812345678</a>
                                    <a href="mailto:myname@domain.com" class="card-text a-link f-dark">E-mail : myname@domain.com</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="single-button-panel" data-aos="">
                    <%--<a class="btn-lg btn1 btn-sm-large" runat="server" href="~/faculties">Show More</a>--%>
                </div>
            </div>
        </section>

        <%-- Get Admission --%>
        <%--<section class="wrapper">
            <div class=" my-4">
                <div class="row ">
                    <div class="col-12 admission-bg-img">
                        <div class="col-lg-7 admission-text-box mb-5 pt-5" data-aos="">
                            <h1 class="admission-title mb-4 f-light">Get Admission in Our Institution</h1>
                            <p class="text-center mb-5 f-light">
                                The company itself is a very successful company. Let it be understood that she must escape from the labors
                        of a happy life! He repulses when he sees that he will be repelled, he will criticize the pleasure of 
                        something, and the whole will be pursued by his own debts!
                            </p>
                            <div class="width-sm-lg">
                                <a href="~/admission" runat="server" class="btn-lg btn1 btn-sm-large get-admit">Get Admission</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>


        <%-- About Section --%>
        <section class="wrapper">
            <div class=" mb-5">
                <div class="row" data-aos="">
                    <div class="col-lg-6">
                        <img class="about-img" src="image/education-1.png" alt="AHR School and College" />
                    </div>
                    <div class="col-lg-6 about-text-div">
                        <h1 class="about-text mt-2 mb-4 about-title">About Our Institute</h1>
                        <p class="lead">Nutan Baktar Char School and College is located in the village of Keraniganj, Dhaka, Bangladesh.</p>
                        <p class="lead">School and College under MPO which was established in 1962 .</p>
                        <div class="width-sm-lg mt-3">
                            <a class="btn-lg btn1 btn-sm-large" runat="server" href="~/about">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%-- Contact Us  --%>
        <section class="wrapper">
            <div class=" container mb-5">
                <div class="row cont-box-1">
                    <div class="col-lg-6 mx-auto">
                        <h1 class="mt-2 mb-4 text-center contact-title">Contact with Us</h1>
                    </div>
                </div>
                <div class="row contact" data-aos="">
                    <div class="col-lg-6 px-5 my-auto">
                        <h1 class="mt-2 mb-4 text-center contact-title cont-tit-2">Contact with Us</h1>
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
                            <asp:Button ID="btn_contact" Text="Submit" runat="server" class="btn-lg btn1 btn-large" />
                        </div>
                    </div>
                    <div class="col-lg-6 contact-img-div">
                        <img class="contact-img" src="image/contact_us.png" alt="AHR School and College" />
                    </div>
                </div>
            </div>
        </section>
        <section class="wrapper" data-aos="">
            <div class="containern">
                <div class="row location">
                    <h1 class="ps-4 text-center location-title">Our Location</h1>
                </div>
                <div class="row">
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe class="g-map" id="gmap_canvas"
                                src="https://maps.google.com/maps?q=%E0%A6%85%E0%A6%A7%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%AA%E0%A6%95%20%E0%A6%B9%E0%A6%BE%E0%A6%AE%E0%A6%BF%E0%A6%A6%E0%A7%81%E0%A6%B0%20%E0%A6%B0%E0%A6%B9%E0%A6%AE%E0%A6%BE%E0%A6%A8%20%E0%A6%B8%E0%A7%8D%E0%A6%95%E0%A7%81%E0%A6%B2%20%E0%A6%85%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%A8%E0%A7%8D%E0%A6%A1%20%E0%A6%95%E0%A6%B2%E0%A7%87%E0%A6%9C,%20JCR7+G64,%20%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE%E0%A5%A4&t=&z=19&ie=UTF8&iwloc=&output=embed"
                                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <a href="https://www.embedgooglemap.net"></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>


