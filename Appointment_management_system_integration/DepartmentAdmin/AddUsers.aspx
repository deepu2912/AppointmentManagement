<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddUsers.aspx.cs" Inherits="Appointment_management_system_integration.DepartmentAdmin.AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Users - Tata Power Delhi Distribution Limited</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Add Users</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">
                        <button type="button" id="Back_to_Department_list" class="btn btn-block btn-success btn-sm">
                            <i class=" fa fa-arrow-left"></i>
                            Back
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <%--Add Department--%>
        <section class="content">
            <div class="row">
                <div class="col-md-5">
                    <div class="card card-secondary">
                        <div class="card-header">
                            <h3 class="card-title">Add Users</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <label for="adminId">Employee Id</label>
                            <div class="input-group mb-3">
                                <input type="text" id="adminId" placeholder="Enter Employee Id..." onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" class="form-control" />
                                <select class="form-control" id="UserType">
                                    <option value="Admin">Admin</option>
                                    <option selected="selected" value="User">User</option>
                                </select>
                                <div class="input-group-append addEmployees">
                                    <span class="input-group-text clickable_events">
                                        <i class="fa fa-plus "></i>
                                    </span>
                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-md-7">
                    <div class="card card-secondary">
                        <div class="card-header">
                            <h3 class="card-title">Users</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">

                            <div class="container" id="adminEmployees">
                                <!-- /Employees Selection Div -->
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <div class="row">
                <div class="col-12 mb-5">
                    <span class="btn-danger" id="lblMsg" runat="server"></span>
                    <input type="button" id="btnAddUser" value="Add" class="btn btn-success float-right">
                </div>
            </div>
        </section>
        <%--Add Department--%>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>

        $('#btnAddUser').click(function (e) {

            if (Employees.length == 0) {
                ErrorAlert("Please select atleast one  Employee");
                $('#adminId').focus();
                return false;
            }

            if (confirm('Are you sure want to add all employees.')) {
                var EmpID = "";
                Employees.forEach(function (index) {
                    EmpID = EmpID + "," + index.EmpID + "~" + index.Role;
                });

                $.ajax({
                    type: "POST",
                    url: "AddUsers.aspx/AddUsersToDepartment",
                    contentType: "application/json; charset=utf-8",
                    data: '{"EmpID":"' + EmpID + '"}',
                    dataType: "json",
                    processData: false,
                    beforeSend: function () {
                        $(".loading").show();
                    },
                    success: function (msg) {
                        if (msg.d != "") {
                            var Status = JSON.parse(msg.d).status;
                            var data = JSON.parse(msg.d).data;

                            if (Status === 100) {
                                var tableData = '';
                                for (var i = 0; i < data.length; i++) {
                                    tableData = tableData + "<tr><td>" + data[i].EMP_ID + "</td><td>" + data[i].Name
                                        + "</td><td>" + data[i].Department_Name + "</td></tr>";
                                }
                                tableData = "<div class='row'><div class='col-12'>These Employees already exists with another Department, Please remove.</div><div class='col-12'><table class='table table-bordered table-striped dataTable dtr-inline'>" + tableData + "</table></div></div>";
                                ErrorAlertMiddle(tableData);
                            }
                            else if (Status === 200) {
                                SuccessAlert("Employees Added Successfully.");
                                Employees = [];
                                setTimeout(function (e) {
                                    window.location.href = "users.aspx";
                                }, 3000);
                            }
                            else if (Status === 401) {
                                SuccessAlert("Error Please try again or Contact Developer.")
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
            }
        })


        /// Selected Employees List Global Variable,
        var Employees = [];

        $('#adminId').keyup(function (e) {
            if (e.keyCode == 13) {
                $('.addEmployees').trigger("click");
            }
        });
        $('.addEmployees').click(function (e) {
            e.preventDefault();
            var EmpID = $('#adminId').val();
            var UserType = $('#UserType').find(":selected").val();

            if (EmpID == "") {
                ErrorAlert("Please Enter Employee ID");
                return false;
            }

            ///Check Duplicacy of Employees is a array or not.
            for (var i = 0; i < Employees.length; i++) {
                if (Employees[i].EmpID === EmpID) {
                    ErrorAlert("Employee Already Added.")
                    return false;
                }
            }
            $.ajax({
                type: "POST",
                url: "AddUsers.aspx/FetchEmployeeDetailsTele",
                contentType: "application/json; charset=utf-8",
                data: '{"EmpID":"' + EmpID + '"}',
                dataType: "json",
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    if (msg.d != "") {
                        $('#adminId').val('');
                        var array = JSON.parse(msg.d);
                        var EmployeeData = {
                            EmpID: array[0].Employee_Number,
                            EmpName: array[0].AD_Display_Name,
                            Department_Name: array[0].Department,
                            Role: UserType
                        };
                        Employees.push(EmployeeData);
                        createEmployeesDiv(Employees);
                    }
                    else {
                        ErrorAlert("Incorrect Employee ID. Please enter Correct Employee ID.");
                        $('#adminId').focus();
                    }
                },
                complete: function () {
                    $(".loading").hide();
                },
                error: function (req, status, error) {
                    ErrorAlert("Error try again");
                }
            });

        })
        //function to create div of selected employee for admin role.
        function createEmployeesDiv(Employees) {
            var count = 1;
            var Data = "";


            Employees.forEach(function (index) {
                Data = Data + '<div class="employee_design_block"> <div class="row"> <div class="col-1"> ' + count + '' +
                    '</div>  <div class="col-4 empID" empID="' + index.EmpID + '"> ' + index.EmpName + ' (  ' + index.EmpID
                    + ')</div>' +
                    '<div class="col-2">' + index.Role + '  </div> <div class="col-4">' + index.Department_Name + '  </div>  <div class="col-1">' +
                    '<i class="fa fa-times Remove_Employee clickable_events"></i> </div> </div> </div>';
                count++;
            })


            //bind the data in admin Employees div
            $('#adminEmployees').empty();
            $('#adminEmployees').html(Data);

            //remove the employee from a div
            $('#adminEmployees .Remove_Employee').click(function (e) {
                e.preventDefault();
                $(this).parent().parent().parent().fadeOut(300, function () { $(this).remove(); });
                var empID = $(this).parent().parent().find('.empID').attr('empID');

                for (var i = 0; i < Employees.length; i++) {
                    if (Employees[i].EmpID === empID) {
                        Employees.splice(i, 1);
                    }
                }

                createEmployeesDiv(Employees);
            })

        }


    </script>
</asp:Content>
