<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Editdepartment.aspx.cs" Inherits="Appointment_management_system_integration.Super_Admin.Editdepartment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/Css/njtimepicker.css") %>">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Update Department Details</h1>
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
        <input type="hidden" id="DepartmentID" value="" runat="server" />
        <%--Add Department--%>
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Department Details</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="txtdepartmentName">Department Name</label>
                                <input type="text" id="txtdepartmentName" maxlength="50" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="officialsCount">Officials Count</label>
                                <input type="text" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" maxlength="2" id="officialsCount" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="slotDuration">Slot Duration (in Mins.)</label>
                                <input type="text" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" maxlength="2" id="slotDuration" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="slotStartTime">Slot Start Time</label>
                                <input type="text" readonly="readonly" id="slotStartTime" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="slotEndTime">Slot End Time</label>
                                <input type="text" readonly="readonly" id="slotEndTime" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="nextVisibleDays">Next Visible Days</label>
                                <input type="text" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" maxlength="2" id="nextVisibleDays" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="basedOn">Appointment Based on</label>
                                <select class="form-control" id="basedOn">
                                    <option value="--Select--">--Select--</option>
                                    <option value="Notification Number">Notification Number</option>
                                    <option value="Contract Account Number">Contract Account Number</option>
                                    <option value="Notification Number / Contract Account Number">Both</option>
                                </select>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-md-6">
                    <div class="card card-secondary">
                        <div class="card-header">
                            <h3 class="card-title">Admin Details</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <label for="adminId">Employee Id</label>
                            <div class="input-group mb-3">
                                <input type="text" id="adminId" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" class="form-control" />
                                <div class="input-group-append addEmployees">
                                    <span class="input-group-text clickable_events">
                                        <i class="fa fa-plus "></i>
                                    </span>
                                </div>
                            </div>
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

                    <input type="button" id="btnCreateDepartment" value="Update Department" class="btn btn-success float-right">
                </div>
            </div>
        </section>
        <%--Add Department--%>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="<%= Page.ResolveUrl("~/media/Jquery/njtimepicker.js") %>"></script>

    <script>
        (function () {
            let format_12 = document.querySelector('#slotStartTime');
            var format_12_picker = new NJTimePicker({
                targetID: 'slotStartTime',
                autoSave: false,
                texts: {
                    header: 'Slot Start Time'
                }
            });
            format_12_picker.on('save', function (data) {
                if (data.fullResult)
                    format_12.textContent = data.fullResult;
            });
            format_12_picker.on('ready', function (data) {
                return
                format_12_picker.setValue({
                    hours: 12,
                    minutes: 45,
                    ampm: 'AM'
                });
            });


            let format_12_end = document.querySelector('#slotEndTime');
            var format_12_picker_end = new NJTimePicker({
                targetID: 'slotEndTime',
                autoSave: false,
                texts: {
                    header: 'Slot End Time'
                }
            });
            format_12_picker_end.on('save', function (data) {
                if (data.fullResult)
                    format_12_end.textContent = data.fullResult;
            });
            format_12_picker_end.on('ready', function (data) {
                return
                format_12_picker_end.setValue({
                    hours: 12,
                    minutes: 45,
                    ampm: 'AM'
                });
            });


        })();
    </script>

    <script>

        $('#btnCreateDepartment').click(function (e) {
            e.preventDefault();
            var DepartmentName = $('#txtdepartmentName').val();
            var OfficialCount = $('#officialsCount').val();
            var SlotDuration = $('#slotDuration').val();
            var SlotStartTime = $('#slotStartTime').val();
            var SlotEndTime = $('#slotEndTime').val();
            var NextVisibleDays = $('#nextVisibleDays').val();
            var DepartmentID = $(this).attr('DepartmentID');
            var BasedOn = $('#basedOn').val();

            if (DepartmentName == "") {
                ErrorAlert("Please Enter Department Name");
                return false;
            }
            else if (OfficialCount == "") {
                ErrorAlert("Please Enter no of officials");
                return false;
            }
            else if (SlotDuration == "") {
                ErrorAlert("Please Enter Slot Duration");
                return false;
            }
            else if (SlotStartTime == "") {
                ErrorAlert("Please Enter Slot Start Time");
                return false;
            }
            else if (SlotEndTime == "") {
                ErrorAlert("Please Enter Slot End Time");
                return false;
            }
            else if (NextVisibleDays == "") {
                ErrorAlert("Please Enter Next Visible Days");
                return false;
            }
            else if (Employees.length == 0) {
                ErrorAlert("Please select atleast one Admin Employee");
                $('#adminId').focus();
                return false;
            }
            else if (BasedOn == "--Select--") {
                ErrorAlert("Please select Appointment Based on");
                return false;
            }
            else {

                var OldEmpID = "";
                var NewEmpID = "";
                debugger;
                Employees.forEach(function (index) {
                    OldEmployees.forEach(function (old) {
                        if (old.EmpID == index.EmpID) {
                            index.Type = "Old"
                        }
                    })
                });

                Employees.forEach(function (index) {
                    if (index.Type === "New") {
                        NewEmpID = NewEmpID + "," + index.EmpID;
                    } else {
                        OldEmpID = OldEmpID + "," + index.EmpID;
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "Editdepartment.aspx/UpdateDepartment",
                    contentType: "application/json; charset=utf-8",
                    data: '{"DepartmentName":"' + DepartmentName + '","OfficialCount":"' + OfficialCount
                        + '","SlotDuration":"' + SlotDuration + '","SlotStartTime":"' + SlotStartTime
                        + '","SlotEndTime":"' + SlotEndTime + '","NextVisibleDays":"' + NextVisibleDays
                        + '","NewEmpID":"' + NewEmpID + '","OldEmpID":"' + OldEmpID + '","Department_ID":"' + DepartmentID
                        + '","BasedOn":"' + BasedOn + '"}',
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
                                SuccessAlert("Department Created Successfully.");
                                Employees = [];
                                setTimeout(function (e) {
                                    window.location.href = "departments.aspx";
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
            }
        })


        $('#Back_to_Department_list').click(function (e) {
            window.location.href = "departments.aspx"
        })

        /// Selected Employees List Global Variable,
        var Employees = [];
        var OldEmployees = [];

        $('#adminId').keyup(function (e) {
            if (e.keyCode == 13) {
                $('.addEmployees').trigger("click");
            }
        });


        $('.addEmployees').click(function (e) {
            e.preventDefault();
            var EmpID = $('#adminId').val();
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
                url: "AddDepartment.aspx/FetchEmployeeDetailsTele",
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
                        debugger;
                        var EmployeeData = {
                            EmpID: array[0].Employee_Number,
                            EmpName: array[0].AD_Display_Name,
                            Department_Name: array[0].Department,
                            Type: "New"
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

            debugger;
            Employees.forEach(function (index) {
                Data = Data + '<div class="employee_design_block"> <div class="row"> <div class="col-1"> ' + count + '' +
                    '</div>  <div class="col-5 empID" empID="' + index.EmpID + '"> ' + index.EmpName + ' (  ' + index.EmpID
                    + ')</div>' +
                    '<div class="col-5">  ' + index.Department_Name + '  </div>  <div class="col-1">' +
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


        $(document).ready(function (e) {
            $.ajax({
                type: "POST",
                url: "Editdepartment.aspx/FetchDepartmentDetails",
                contentType: "application/json; charset=utf-8",
                data: '{"DepartmentID":"' + $('#DepartmentID').val() + '"}',
                dataType: "json",
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    if (msg.d != "") {
                        //$('#adminId').val('');
                        var array = JSON.parse(msg.d);
                        debugger;
                        if (array.status == "200") {
                            var departmentDetails = array.departmentData;
                            var adminData = array.adminData;
                            $('#txtdepartmentName').val(departmentDetails[0].Department_Name);
                            $('#officialsCount').val(departmentDetails[0].No_of_officials);
                            $('#slotDuration').val(departmentDetails[0].Slot_duration);
                            $('#slotStartTime').val(departmentDetails[0].Slot_start_time);
                            $('#slotEndTime').val(departmentDetails[0].Slot_end_time);
                            $('#nextVisibleDays').val(departmentDetails[0].No_of_days);
                            $('#basedOn').val(departmentDetails[0].Based_On)
                            adminData.forEach(function (index) {
                                var EmployeeData = {
                                    EmpID: index.EMP_ID,
                                    EmpName: index.Name,
                                    Department_Name: index.EmpDepartment,
                                    Type: "Old"
                                };
                                Employees.push(EmployeeData);
                                OldEmployees.push(EmployeeData);
                            });
                            createEmployeesDiv(Employees);

                            $('#btnCreateDepartment').attr('DepartmentID', departmentDetails[0].ID)

                        } else {
                            ErrorAlert("Error! Please try after sometime.");
                        }
                    }
                    else {
                        ErrorAlert("Error! Please try after sometime.");
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

    </script>
</asp:Content>
