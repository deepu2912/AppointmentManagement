<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Appointment_management_system_integration.DepartmentAdmin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Users - Tata Power Delhi Distribution Limited</title>

    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/fontawesome-free/css/all.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/css/responsive.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/plugins/datatables-buttons/css/buttons.bootstrap4.min.css") %>">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Users</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">
                        <button type="button" id="Add_Users" class="btn btn-block btn-success btn-sm">
                            <i class=" fa fa-plus"></i>
                            Add Users
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <%--Table--%>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">

                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Sno</th>
                                            <th>Employee ID</th>
                                            <th>Employee Name</th>
                                            <th>Mobile No</th>
                                            <th>Email ID</th>
                                            <th>Department</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="UserData" runat="server">
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Sno</th>
                                            <th>Employee ID</th>
                                            <th>Employee Name</th>
                                            <th>Mobile No</th>
                                            <th>Email ID</th>
                                            <th>Department</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <%--Table--%>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/js/dataTables.responsive.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/js/responsive.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/dataTables.buttons.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/jszip/jszip.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/pdfmake/pdfmake.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/pdfmake/vfs_fonts.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.html5.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.print.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.colVis.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/Jquery/njtimepicker.js") %>"></script>
    <script>
        $(function () {
            $("#example1").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

        });
        $('#Add_Users').click(function (e) {
            window.location.href = "addusers.aspx"
        });

        $('.deleteUser').click(function (e) {
            e.preventDefault();
            var EmployeeID = $(this).attr('empid');
            var UserRowID = $(this).attr('userrowid');
            if (confirm('Are you sure want to remove employee.')) {
                $.ajax({
                    type: "POST",
                    url: "Users.aspx/DeleteUserDepartment",
                    contentType: "application/json; charset=utf-8",
                    data: '{"EmployeeID":"' + EmployeeID + '","UserRowID":"' + UserRowID + '"}',
                    dataType: "json",
                    processData: false,
                    beforeSend: function () {
                        $(".loading").show();
                    },
                    success: function (msg) {
                        if (msg.d != "") {
                            var Status = JSON.parse(msg.d).status;
                            var data = JSON.parse(msg.d).data;

                            if (Status === 200) {
                                SuccessAlert("Employees removed successfully.");
                                setTimeout(function (e) {
                                    window.location.reload();
                                }, 3000);
                            }
                            else if (Status === 401) {
                                ErrorAlert("Error Please try again or Contact Developer.")
                            }

                        }
                    },
                    complete: function () {
                        $(".loading").hide();
                    },
                    error: function (req, status, error) {
                        ErrorAlert("Error try again");
                    }
                });
            };
        });

        $('.ShowUser').click(function (e) {
            e.preventDefault();
            var EmployeeID = $(this).attr('empid');
            var UserRowID = $(this).attr('userrowid');
            if (confirm('Are you sure want to sign in employee.')) {
                $.ajax({
                    type: "POST",
                    url: "Users.aspx/ShowUserDepartment",
                    contentType: "application/json; charset=utf-8",
                    data: '{"EmployeeID":"' + EmployeeID + '","UserRowID":"' + UserRowID + '"}',
                    dataType: "json",
                    processData: false,
                    beforeSend: function () {
                        $(".loading").show();
                    },
                    success: function (msg) {
                        if (msg.d != "") {
                            var Status = JSON.parse(msg.d).status;
                            var data = JSON.parse(msg.d).data;

                            if (Status === 200) {
                                SuccessAlert("Employee visibility updated successfully.");
                                setTimeout(function (e) {
                                    window.location.reload();
                                }, 3000);
                            }
                            else if (Status === 401) {
                                ErrorAlert("Error Please try again or Contact Developer.")
                            }

                        }
                    },
                    complete: function () {
                        $(".loading").hide();
                    },
                    error: function (req, status, error) {
                        ErrorAlert("Error try again");
                    }
                });
            };
        });

        

        $('.HideUser').click(function (e) {
            e.preventDefault();
            var EmployeeID = $(this).attr('empid');
            var UserRowID = $(this).attr('userrowid');
            if (confirm('Are you sure want to sign out employee.')) {
                $.ajax({
                    type: "POST",
                    url: "Users.aspx/HideUserDepartment",
                    contentType: "application/json; charset=utf-8",
                    data: '{"EmployeeID":"' + EmployeeID + '","UserRowID":"' + UserRowID + '"}',
                    dataType: "json",
                    processData: false,
                    beforeSend: function () {
                        $(".loading").show();
                    },
                    success: function (msg) {
                        if (msg.d != "") {
                            var Status = JSON.parse(msg.d).status;
                            var data = JSON.parse(msg.d).data;

                            if (Status === 200) {
                                SuccessAlert("Employee visibility updated successfully.");
                                setTimeout(function (e) {
                                    window.location.reload();
                                }, 3000);
                            }
                            else if (Status === 401) {
                                ErrorAlert("Error Please try again or Contact Developer.")
                            }

                        }
                    },
                    complete: function () {
                        $(".loading").hide();
                    },
                    error: function (req, status, error) {
                        ErrorAlert("Error try again");
                    }
                });
            };
        });
    </script>
</asp:Content>
