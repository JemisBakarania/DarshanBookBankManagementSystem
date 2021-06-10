<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStudentProfile.aspx.cs" Inherits="AdminPanel_Student_ViewStudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidenav" runat="Server">
    <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
        <div class="scrollbar-inner">
            <!-- Brand -->
            <div class="sidenav-header  align-items-center" style="margin-top: 30px;">

                <asp:Image ImageUrl="~/Content/img/brand/Logo.png" Height="160px" runat="server" />
            </div>
            <div class="navbar-inner" style="margin-top: 70px;">
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                    <!-- Nav items -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink ID="hlHomePage" NavigateUrl="~/HomePage.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-tv-2 text-primary"></i>
                                    <span class="nav-link-text">Home</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="hlIssueBook" NavigateUrl="~/AdminPanel/Book/IssueBook.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-books text-orange"></i>
                                    <span class="nav-link-text">Issue Book</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="hlReturnBook" NavigateUrl="~/AdminPanel/Book/ReturnBook.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-book-bookmark text-pink"></i>
                                    <span class="nav-link-text">Return Book</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-single-copy-04 text-info"></i>
                                    <span class="nav-link-text">Book Inventory</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="hlStudentrofile" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" runat="server" CssClass="nav-link active">
                                    <i class="ni ni-single-02 text-yellow"></i>
                                    <span class="nav-link-text">Student Profile</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/AdminPanel/AdminUser/AdminUserProfile.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-settings"></i>
                                    <span class="nav-link-text">My Profile</span>
                            </asp:HyperLink>
                        </li>

                    </ul>
                    <!-- Divider -->
                    <hr class="my-3">
                    <!-- Heading -->

                    <!-- Navigation -->

                </div>
            </div>
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" Text="Student Profile"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumThird" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Student/EditStudent.aspx" Text="Edit Student"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Student
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Student Profile
    
    <div style="float: right;">
        <i class="ni ni-bold-left"></i>
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-info btn-sm" OnClientClick="JavaScript:window.history.back(1); return false;" OnClick="btnCancel_Click" />
    </div>

</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cphMainArea" runat="Server">
    
    <div class="col-md-12" style="margin-top: auto;">
        <div class="jemis card-profile" style="margin-top: 50px;">
            <div class="row justify-content-center">
                <div class="col-lg-3 order-lg-2">
                    <div class="card-profile-image">
                        <a href="#">
                            <asp:Image ImageUrl="~/Content/img/theme/StudentProfile-2.jpg" runat="server" CssClass="rounded-circle" />
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                <div class="d-flex justify-content-between">
                    <%--<asp:Button ID="btnUpdate" Text="Update" CssClass="btn btn-sm btn-outline-warning  mr-4" runat="server" />
                    <asp:Button ID="btnDelete" Text="Delete" CssClass="btn btn-sm btn-outline-danger float-right" runat="server" />--%>

                </div>
            </div>
            <div>
                <br />
                <br />
            </div>
            <div class="card-body pt-0">

                <div class="text-center">
                    <h5 class="h3">
                        <asp:Label Text="Name" runat="server" ID="txtStudentName"></asp:Label>
                    </h5>
                    <div class="h5 font-weight-300">
                        <asp:Label Text="Enrollment" runat="server" ID="txtStudentEnrollmentNo"></asp:Label>
                    </div>
                    <div class="h5 font-weight-300">
                        <asp:Label Text="Email" runat="server" ID="txtEmail"></asp:Label>
                    </div>
                    <div class="h5 mt-4">
                        <i class="ni business_briefcase-24 mr-2"></i>
                    </div>
                    <div>
                        Student of
                        <asp:Label Text="Branch" ID="txtBracnh" runat="server"></asp:Label><br />
                        <asp:Label Text="Institute" runat="server" ID="txtInstitute"></asp:Label>
                    </div>
                </div>
                <div class="row">

                    <div class="col">
                        <div class="card-profile-stats d-flex justify-content-center">
                            <div>
                                <span class="heading"></span>
                                <span class="description"></span>
                            </div>
                            <div>

                                <asp:Label Text="Registered Date" runat="server" ID="lblRegisteredDate"></asp:Label>
                                <br />
                                <span class="description">Student Registered Date
                                </span>
                            </div>
                            <div>
                                <span class="heading"></span>
                                <span class="description"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-profile-stats d-flex justify-content-center">
                            <div>
                                <span class="heading"></span>
                                <span class="description"></span>
                            </div>
                            <div>
                                <asp:Label Text="Updated Date" runat="server" ID="lblUpdatedDate"></asp:Label>
                                <br />
                                <span class="description">Last Update (Profile) Date
                                </span>
                            </div>
                            <div>
                                <span class="heading"></span>
                                <span class="description"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    
                  <asp:Panel CssClass="table table-borderless" runat="server">
                    <div class="col-md-12">
                        <asp:Label ID="lblErrorMessage" CssClass="" runat="server"></asp:Label>
                        <asp:GridView OnRowCommand="gvStudentByEnrollmentNo_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvStudentByEnrollmentNo" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookTitle" HeaderText="Book Title" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyNo" HeaderText="Serial No" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookIssueDate" HeaderText="Book Issue Date" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookDueDate" HeaderText="Book Return Date" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Return" CommandName="Return" CommandArgument='<%# Eval("BookCopyNo") %>' CssClass="btn btn-warning btn-md" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                      </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

