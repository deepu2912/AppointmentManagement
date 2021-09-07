<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookappointment.aspx.cs" Inherits="Appointment_management_system_integration.Appointment.bookappointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Appointment Management System Tata Power Delhi Distribution Limited</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/mdb.min.css") %>" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/mdbstyle.css") %>" />
    <link href="<%= Page.ResolveUrl("~/media/Css/custom.css") %>" rel="stylesheet" />
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css") %>" />
    <style>
        @media(min-width:992px) {
            .margin_left {
                margin-left: 150px;
            }
        }

        .my-5 {
            margin-top: 10rem !important;
            margin-bottom: 3rem !important;
        }
    </style>
</head>
<body>
    <header class="mb-4 fixed-top">
        <div class="p-2 text-center bg-white border-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5 margin_left d-flex justify-content-center justify-content-md-start align-items-center d-lg-flex">
                        <a class="text-reset me-3" href="Javascript:void(0)">
                            <img src="<%= Page.ResolveUrl("~/media/Images/logo.png") %>" />
                        </a>
                    </div>
                    <div class="col-md-2 d-none d-lg-block">
                    </div>
                    <div class="col-lg-5 d-flex justify-content-center justify-content-md-end align-items-center">
                    </div>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-white d-lg-block" style="display: block !important; color: #fff; background-color: #1968b3!important">
            <!-- Container wrapper -->
            <div class=" justify-content-center justify-content-md-between text-center">
                <!-- Left elements -->
                <div class=" align-items-center">
                    <div class="row">
                        <div class="col-lg-12">
                            <span style="font-size: 20px; font-weight: 600;" id="DepartmentName" runat="server"></span>
                        </div>
                    </div>

                </div>
                <div>
                </div>

            </div>

        </nav>

    </header>

    <section id="SlotSection" class="bg-image" style="height: 100vh;">
        <div class="mask" style="background-color: #f6f6f6;">
            <section class="text-center my-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-sm-10 col-10 col-lg-8" style="text-align: initial; border: 2px solid #1968b3; background: white; border-radius: 12px; padding: 15px;">

                        <h4 class="h1-responsive font-weight-bold" style="text-decoration: underline;" id="BookAppointmentTagline" runat="server">Book Appointment</h4>
                        <p class="grey-text mb-5" style="font-size: 14px;">
                        </p>

                        <div class="row">
                            <div id="appointment_popup_data" class="col-lg-12 col-12">

                                <div class="row">
                                    <div class="col-12 col-lg-4">
                                        <span>Please Select Department</span>
                                    </div>
                                    <div class="col-12 col-lg-8">
                                        <select class="form-control" id="Department">
                                            <option value="--Select--">--Select--</option> 
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2 NotificationNumberDiv" style="display: none;">
                                    <div class="col-12 col-lg-8 mt-1">
                                        <div class="row">
                                            <div class="col-12 col-lg-6">
                                                <span id="spanBasedon"></span>
                                            </div>
                                            <div class="col-12 col-lg-6">
                                                <input type="text" class="form-control" id="NotificationNo" maxlength="12" value="" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-12 col-lg-4 mt-1">
                                        <input type="button" id="txtProceed" class="btn btn-success" value="Proceed" />
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-lg-12 text-center mt-2">
                                            <span id="txtErrorMsg" style="font-size: 18px; color: red;"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>


    <div class="loading" style="display: none;">Loading&#8230;</div>
</body>
<script src='<%= Page.ResolveUrl("~/media/plugins/jquery/jquery.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/plugins/toastr/toastr.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/Jquery/Datepicker.jquery.ui.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/plugins/sweetalert2/sweetalert2.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/Jquery/Common.js") %>'></script>
<script>
    $(document).ready(function (e) {

        //Call the visible dates on load.
        fnGetDepartmentDates();
    })

    function fnGetDepartmentDates(e) {
        $.ajax({
            type: "POST",
            url: "<%= Page.ResolveUrl("~/Appointment/bookappointment.aspx/GetDepartmentData") %>",
            contentType: "application/json; charset=utf-8",
            data: '',
            dataType: "json",
            beforeSend: function () {
                $(".loading").show();
            },
            success: function (msg) {
                if (msg.d != "") {
                    debugger;
                    var Status = JSON.parse(msg.d).status;
                    var data = JSON.parse(msg.d).data;

                    var DepData = "<option value='--Select--'>--Select--</option>";
                    if (Status === 200) {

                        data.forEach(function (index) {
                            DepData = DepData + "<option value='" + index.DepartmentName + "' BasedOn='" + index.Based_On + "' DepID='" + index.DepartmentID + "'>" + index.DepartmentName + "</option>";
                        });
                        $('#Department').html(DepData);
                    } else {
                        ErrorAlert('Please try again.')
                    }
                }
                else {
                    ErrorAlert('Please try again.')
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

    $('#Department').change(function (e) {
        if ($(this).val() == "--Select--") {
            $('.NotificationNumberDiv').hide();
            $('#NotificationNo').attr('Department_BasedOn', "");
            $('#NotificationNo').attr('Department_ID', "");
            $('#NotificationNo').attr('Department_Name', "");
            $('#txtErrorMsg').html('');
            return false;
        }

        var Department_BasedOn = $(this).find('option:selected').attr('basedon');
        $('.NotificationNumberDiv').show();
        $('#spanBasedon').html(Department_BasedOn + " :");
        $('#NotificationNo').attr('Department_BasedOn', Department_BasedOn);
        $('#NotificationNo').attr('Department_ID', $(this).find('option:selected').attr('depid'));
        $('#NotificationNo').attr('Department_Name', $(this).find('option:selected').val());
        $('#txtErrorMsg').html('');

        $('#txtProceed').click(function (e) {
            e.preventDefault();

            var notification = $('#NotificationNo').val();

            if (notification) {

            } else {
                ErrorAlert('Please enter ' + $('#NotificationNo').attr('Department_BasedOn'))
                $('#txtProceed').focus();
                return false;
            }

            $.ajax({
                type: "POST",
                url: "<%= Page.ResolveUrl("~/Appointment/bookappointment.aspx/ProceedAppointment") %>",
                contentType: "application/json; charset=utf-8",
                data: '{"DepartmentID":"' + $('#NotificationNo').attr('Department_ID')
                    + '","BasedOn":"' + $('#NotificationNo').attr('Department_BasedOn')
                    + '","Noti_Ca_no":"' + $('#NotificationNo').val() + '" ,"DepartmentName":"' + $('#NotificationNo').attr('Department_Name') + '"}',
                dataType: "json",
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    if (msg.d != "") {

                        var Status = JSON.parse(msg.d).status;
                        var data = JSON.parse(msg.d).result;
                        var URL = JSON.parse(msg.d).Url;
                        if (Status === 200) {
                            window.open(URL,"_self");
                        } else {
                            $('#txtErrorMsg').html('Invalid number, Please enter correct ' + $('#NotificationNo').attr('Department_BasedOn'));
                        }
                    }
                    else {
                        ErrorAlert('Please try again.')
                    }
                },
                complete: function () {
                    $(".loading").hide();
                },
                error: function (req, status, error) {
                    ErrorAlert("Error try again");
                }
            });


            e.stopImmediatePropagation();
        })
    })



</script>
</html>
