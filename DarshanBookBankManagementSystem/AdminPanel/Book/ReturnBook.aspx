<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnBook.aspx.cs" Inherits="AdminPanel_Book_ReturnBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Return Book 
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cphSidenav" runat="server">
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
                            <asp:HyperLink ID="hlReturnBook" NavigateUrl="~/AdminPanel/Book/ReturnBook.aspx" runat="server" CssClass="nav-link active">
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
                            <asp:HyperLink ID="hlStudentrofile" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" runat="server" CssClass="nav-link">
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
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Return Book 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Return Book
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMainArea" runat="Server">

    <asp:Panel runat="server" BackColor="#F7F7F7">
        <asp:Label ID="lblErrorMessage" CssClass="text-danger" runat="server"></asp:Label>
        <br />
        <div class="container">
            <asp:Label runat="server" ID="lblSearch" Text="Search Either Book Serial No. or Student Enrollment No."></asp:Label>
            <div class="row" style="padding: 20px;">
                <div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            <asp:TextBox CssClass="form-control" placeholder="Search Here...." ID="txtSearch" runat="server"></asp:TextBox>

                            <%--<input class="form-control" placeholder="Search" type="text">--%>
                        </div>

                    </div>
                    <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <%--<div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            
                            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Here.... " CssClass="form-control"></asp:TextBox>

                            <%--<input class="form-control" placeholder="Search" type="text">--%>
                        <%--</div>

                    </div>
                </div>--%>
                <div class="col-md-3">

                    <div style="padding: 20px; text-align: center; margin-right: 120px;">
                        <asp:LinkButton CssClass="btn btn-outline-default btn-sm rounded-2" ValidationGroup="vgSearch" runat="server" ID="lnbtnSearch" OnClick="lnbtnSearch_Click">
                    <span class="fas fa-search"></span>&nbsp Search
                        </asp:LinkButton>
                        <%--<asp:Button ValidationGroup="vgSearch" ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-info btn-sm " OnClick="btnSearch_Click" />--%>
                    </div>
                </div>
            </div>

            <%--<div class="col-md-5">
                    <div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                        <div class="form-group mb-0">
                            <div class="input-group input-group-alternative input-group-merge">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-search"></i></span>
                                </div>
                                <asp:TextBox ID="txtStudentEnrollmentNo" runat="server" placeholder="Student Enrollment No.... " CssClass="form-control" OnTextChanged="txtStudentEnrollmentNo_TextChanged"></asp:TextBox>

                                <%--<input class="form-control" placeholder="Search" type="text">--%>
            <%--</div>

                        </div>
                        <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                </div>--%>

            <%--<div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="lblBookSerialNo" Text="Book Serial No." runat="server"></asp:Label>
                        <asp:TextBox ID="txtBookSerialNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBookCopyNo" runat="server" ErrorMessage="Enter Book Serial No" ControlToValidate="txtBookSerialNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>
                </div>--%>
        </div>
        <div class="row">
        </div>
        <br />
        <br />
        <asp:Panel CssClass="table table-borderless" ID="pnlStudentBySerialNo" runat="server">

            <div class="row">

                <div class="col-md-12">
                    <asp:GridView OnRowCommand="gvStudentByEnrollmentNo_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvStudentBySerialNo" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                <ItemTemplate>
                                    <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyNo" HeaderText="Serial No" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentName" HeaderText="Student Name" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookIssueDate" HeaderText="Book Issue Date" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookDueDate" HeaderText="Book Return Date" />
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn btn-warning btn-md" CommandName="Return" CommandArgument='<%# Eval("BookCopyNo") %>'>
                                        <span class="fas fa-reply-all"></span>&nbsp Return
                                    </asp:LinkButton>
                                    <%--<asp:Button runat="server" Text="Return" CommandName="Return" CommandArgument='<%# Eval("BookCopyNo") %>' CssClass="btn btn-warning btn-md" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>



        <asp:Panel CssClass="table table-borderless" ID="pnlStudentByEnrollmentNo" runat="server">

            <div class="row">
                <div class="col-md-12">
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
                                    <asp:LinkButton runat="server" CssClass="btn btn-warning btn-md" CommandName="Return" CommandArgument='<%# Eval("BookCopyNo") %>'>
                                        <span class="fas fa-reply-all"></span>&nbsp Return
                                    </asp:LinkButton>
                                    <%--<asp:Button runat="server" Text="Return" CommandName="Return" CommandArgument='<%# Eval("BookCopyNo") %>' CssClass="btn btn-warning btn-md" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>
        </div>
    </asp:Panel>

    <%-------------------------------------------------------------------------------------------------------------------------------- --%>

    <%--<div class="container">
        <asp:Label ID="lblErrorMessage" CssClass="text-danger" runat="server"></asp:Label>
        <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblBookSerialNo" Text="Book Serial No." runat="server"></asp:Label>
                    <asp:TextBox ID="txtBookSerialNo" runat="server" placeholder="Enter Here ... " CssClass="form-control" OnTextChanged="txtBookSerialNo_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <asp:Panel CssClass="table table-borderless" ID="pnlStudentBySerialNo" runat="server">
            <br />
            <br />
            <div class="row">

                <div class="col-md-12">
                    <asp:GridView OnRowCommand="gvStudentByEnrollmentNo_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvStudentBySerialNo" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                <ItemTemplate>
                                    <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyNo" HeaderText="Serial No" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No" />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentName" HeaderText="Student Name" />
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
            </div>
        </asp:Panel>
        <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="text-center">
                    OR
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblStudentEnrollmentNo" Text="Student Enrollment No " runat="server"></asp:Label>
                    <asp:TextBox ID="txtStudentEnrollmentNo" runat="server" placeholder="Enter Here ... " CssClass="form-control" OnTextChanged="txtStudentEnrollmentNo_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <asp:Panel CssClass="table table-borderless" ID="pnlStudentByEnrollmentNo" runat="server">
            <br />
            <br />
            <div class="row">

                <div class="col-md-12">
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
            </div>
        </asp:Panel>
        <div class="row" style="padding: 20px;">
            <div class="co-md-12" style="margin-left: 30%;">
                <div class="form=group">
                    <asp:Button ID="btnSearch" Width="500%" CssClass="btn btn-outline-info" Text="Search" runat="server" OnClick="btnSearch_Click" />
                </div>

            </div>
        </div>
    </div>--%>
</asp:Content>


