<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditStudent.aspx.cs" Inherits="AdminPanel_Student_AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Edit Student
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
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" Text="Student Profile"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Edit Student 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Edit Student
    <div style="float: right;">
        <asp:LinkButton CssClass="btn btn-info" runat="server" ID="LinkButton1" OnClick="LinkButton1_Click">
                    <span class="ni ni-circle-08"></span>&nbsp Add New Student
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMainArea" runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Student Deleted',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
    <asp:Panel runat="server" BackColor="#F7F7F7">
        <div class="container">
            <div class="row" style="padding: 20px;">
                <div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            <asp:TextBox ID="txtStudentEnrollmentNo" runat="server" placeholder="Student Enrollment No... " CssClass="form-control"></asp:TextBox>

                            <%--<input class="form-control" placeholder="Search" type="text">--%>
                        </div>

                    </div>
                    <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <%--<div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="lblBookSerialNo" Text="Book Serial No." runat="server"></asp:Label>
                        <asp:TextBox ID="txtBookSerialNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBookCopyNo" runat="server" ErrorMessage="Enter Book Serial No" ControlToValidate="txtBookSerialNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>
                </div>--%>
                <div class="col-md-3" style="padding: 20px; margin-top: ;">
                    <asp:LinkButton CssClass="btn btn-outline-default btn-sm rounded-2" ValidationGroup="vgSearch" runat="server" ID="lnbtnSearch" OnClick="lnbtnSearch_Click">
                    <span class="fas fa-search"></span>&nbsp Search
                    </asp:LinkButton>
                    <%--<asp:Button ValidationGroup="vgSearch" ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-info btn-sm " OnClick="btnSearch_Click" />--%>
                </div>
                <div class="col-md-3" style="padding: 20px; margin-top: 5px; float: right;">
                    <asp:LinkButton CssClass="btn btn-info btn-md" runat="server" ID="lnbtnViewAll" OnClick="lnbtnViewAll_Click">
                    <span class="ni ni-bullet-list-67"></span>&nbsp View All
                    </asp:LinkButton>
                </div>

            </div>

            <asp:RequiredFieldValidator ID="rfvStudentEnrollmentNo" runat="server" ErrorMessage="Enter Student Enrollment No" ControlToValidate="txtStudentEnrollmentNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
            <asp:Label ID="lblErrorMessage" CssClass="text-danger" runat="server"></asp:Label>
            <asp:Panel CssClass="table table-borderless" ID="pnlStudentByEnrollmentNo" runat="server">

                <div class="row">

                    <div class="col-md-12">
                        <asp:GridView OnRowCommand="gvStudentByEnrollment_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvStudentByEnrollment" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Student">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl="~/Content/img/theme/StudentProfile-2.png" Height="50" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No." />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white " ItemStyle-Font-Bold="true" ItemStyle-CssClass="" DataField="StudentName" HeaderText="Student Name" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls for Profile">
                                    <ItemTemplate>
                                        <itemtemplate>
                                        <asp:LinkButton CommandName="ViewStudent" CommandArgument='<%#Eval("StudentID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>
                                       
                                        <asp:HyperLink runat="server" NavigateUrl='<%#"~/AdminPanel/Student/AddStudent.aspx?StudentID=" + Eval("StudentID") %>' ToolTip="Update" Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:HyperLink>

                                        <asp:LinkButton OnClientClick="return javascript:return confirm('Are You Sure?');" CommandName="DeleteStudent" CommandArgument='<%#Eval("StudentID") %>' runat="server"  ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>

                                    </itemtemplate>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>



            <asp:Panel CssClass="table table-borderless" ID="pnlStudent" runat="server">

                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView OnRowCommand="gvStudentByEnrollment_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light" Width="100%" ID="gvStudent" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Student">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl="~/Content/img/theme/StudentProfile-2.png" Height="50" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No." />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white " ItemStyle-Font-Bold="true" ItemStyle-CssClass="" DataField="StudentName" HeaderText="Student Name" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls for Profile">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="ViewStudent" CommandArgument='<%#Eval("StudentID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>

                                        <asp:HyperLink runat="server" NavigateUrl='<%#"~/AdminPanel/Student/AddStudent.aspx?StudentID=" + Eval("StudentID") %>' ToolTip="Update" Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:HyperLink>

                                        <asp:LinkButton OnClientClick="return javascript:return confirm('Are You Sure?');" CommandName="DeleteStudent" CommandArgument='<%#Eval("StudentID") %>' runat="server" ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </asp:Panel>




    <%--    <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label ID="lblStudentEnrollmentNo" Text="Student Enrollment No." runat="server"></asp:Label>
                    <asp:TextBox ID="txtStudentEnrollmentNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudentEnrollmentNo" runat="server" ErrorMessage="Enter Book Serial No" ControlToValidate="txtStudentEnrollmentNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6" style="margin-left: 510px;">
                <asp:Button ValidationGroup="vgSearch" ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-info btn-sm" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <asp:Label ID="lblErrorMessage" CssClass="text-danger" runat="server"></asp:Label>
        <asp:Panel ID="pnlStudentByEnrollmentNo" runat="server" CssClass="table table-borderless">
            <br /><br />
            <div class="row">
                
                <div class="col-md-12">
                    <asp:GridView BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvStudentByEnrollment" runat="server" AutoGenerateColumns="false">
                        <Columns>
                           <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentID" HeaderText="Sr No" />
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center"  HeaderText="Student">
                                <ItemTemplate>
                                    <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl="~/Content/img/theme/StudentProfile-2.png" Height="50" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No." />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center"  DataField="StudentName" HeaderText="Student Name" />
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls for Profile">
                                <ItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="ViewBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>
                                       
                                        <asp:LinkButton runat="server"  ToolTip="Update" Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:LinkButton>

                                        <asp:LinkButton runat="server"  ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>

                                    </ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>
        <div class="row" style="padding: 20px;">
            <div class="col-md-2">
            </div>
            <div class="col-md-6">
                <div style="margin-left:150px;" class="text-center">
                 OR
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6" style="margin-left: 510px;">
                <asp:Button ID="btnViewAll" runat="server" Text="View All" CssClass="btn btn-outline-info btn-sm" OnClick="btnViewAll_Click"  />
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <asp:Panel ID="pnlStudent" runat="server" CssClass="table table-borderless">
            <br /><br />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView BorderWidth="0px" CssClass="table table-hover align-items-center thead-light" Width="100%"  ID="gvStudent" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="StudentID" HeaderText="Sr No" />
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center"  HeaderText="Student">
                                <ItemTemplate>
                                    <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl="~/Content/img/theme/StudentProfile-2.png" Height="50" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="EntrollmentNo" HeaderText="Entrollment No." />
                            <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center"  DataField="StudentName" HeaderText="Student Name" />
                            <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls for Profile">
                                <ItemTemplate>
                                    <asp:LinkButton CommandName="ViewBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>
                                       
                                        <asp:LinkButton runat="server"  ToolTip="Update" Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:LinkButton>

                                        <asp:LinkButton runat="server"  ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
    </asp:Panel>
    </div>--%>
</asp:Content>
