<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Appointment_management_system_integration.Appointment.home" %>

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
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/dist/css/adminlte.min.css") %>" />
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

        .modal-footer {
            display: block !important;
            justify-content: inherit !important;
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
                            <span style="font-size: 20px; font-weight: 600; color: white;" id="DepartmentName" runat="server"></span>
                        </div>
                    </div>

                </div>
                <div>
                </div>

            </div>

        </nav>

    </header>


    <section id="CheckNotStatus" class="bg-image" style="height: 100vh;">
        <div class="mask" style="background-color: #f6f6f6;">
            <section class="text-center my-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-sm-10 col-10 col-lg-8" style="text-align: initial; border: 2px solid #1968b3; background: white; border-radius: 12px; padding: 15px;">

                        <div class="row">
                            <div class="col-lg-1" style="zoom: 2; margin-top: -3px;">
                                <a href="<%= Page.ResolveUrl("~/appointment/bookappointment.aspx") %>" class="fas fa-arrow-left"></a>
                            </div>
                            <div class="col-lg-11">
                                <h4 class="h1-responsive font-weight-bold" style="text-decoration: underline;"
                                    id="BookAppointmentTagline1" runat="server"></h4>
                            </div>
                        </div>


                        <p class="grey-text mb-2" style="font-size: 14px;">
                            Dear Customer, your appointment details:
                        </p>
                        <div class="row mt-3">
                            <div class="col-12 col-md-6 col-lg-6">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-5">
                                        <span style="font-weight: 500">Mobile No:</span>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-7">
                                        <span id="MobileNo"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-5">
                                        <span style="font-weight: 500">Email ID:</span>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-7" style="word-break: break-word;">
                                        <span id="EmailID"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-6">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <input type="button" class="btn btn-success" id="RescheduledDate" value="Reschedule Appointment" />
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <input type="button" class="btn btn-primary" id="CancelDate" value="Cancel Appointment" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-6">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-5">
                                        <span style="font-weight: 500">Scheduled Date:</span>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-7">
                                        <span id="SlotDate"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-5">
                                        <span style="font-weight: 500">Slot Time:</span>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-7" style="word-break: break-word;">
                                        <span id="SlotTime"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>


    <section id="SlotSection" class="bg-image" style="height: 100vh; display: none;">
        <div class="mask" style="background-color: #f6f6f6;">
            <section class="text-center my-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-sm-10 col-10 col-lg-8" style="text-align: initial; border: 2px solid #1968b3; background: white; border-radius: 12px; padding: 15px;">
                        <div class="row">
                            <div class="col-lg-1" style="zoom: 2; margin-top: -3px;">
                                <a href="<%= Page.ResolveUrl("~/appointment/bookappointment.aspx") %>" class="fas fa-arrow-left"></a>
                            </div>
                            <div class="col-lg-11">
                                <h4 class="h1-responsive font-weight-bold" style="text-decoration: underline;" id="BookAppointmentTagline" runat="server"></h4>

                            </div>
                        </div>

                        <p class="grey-text mb-5" id="Status" style="font-size: 14px;">
                           <%-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores
                            aperiam minima assumenda deleniti hic.--%>
                        </p>

                        <div class="row">
                            <h5 class="h1-responsive font-weight-bold h5SelectDate" style="font-size: 18px;">Select Date
                            </h5>
                            <div id="appointment_popup_data" class="col-lg-12 col-12">
                                <div class="book-appointment-container" style="">
                                    <div class="appointment-day-list" id="Appointment_Dates">
                                    </div>

                                    <div class="appointment-day-slots" id="appointment-day-slots">
                                       
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>

    <div class="modal fade" id="ConfirmAppointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalTitle">Book Appointment</h5>
                    <button
                        type="button"
                        class="btn-close closeModal"
                        data-mdb-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" id="FormDetails">
                    <div class="md-form mb-2">
                        <span>Email ID</span>
                        <input type="email" id="txtEmailID" placeholder="Email ID" class="form-control" />
                    </div>

                    <div class="md-form mb-2">
                        <span>Mobile Number</span>
                        <input type="text" id="txtMobile" placeholder="Mobile Number" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" maxlength="10" class="form-control" />
                    </div>
                </div>
                <div class="modal-body" id="AppointmentDetails" style="display: none;">
                    <div class="row">
                        <div class="col-12 col-lg-12">
                            <h4>Appointment Details</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            Appointment Date :
                        </div>
                        <div class="col-12 col-lg-8">
                            <span id="App_slot_Date"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            Slot Timing :
                        </div>
                        <div class="col-12 col-lg-8">
                            <span id="App_slot_timing"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-6 col-lg-6">
                            <button type="button" class="btn btn-secondary closeModal" data-mdb-dismiss="modal">
                                Cancel
                            </button>
                        </div>
                        <div class="col-6 col-lg-6" style="text-align: end;">
                            <button type="button" class="btn btn-primary" id="NextDetails">Next</button>
                            <button type="button" class="btn btn-primary" id="CreateAppointent" style="display: none;">Create Appointment</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <input id="Reshedule" type="hidden" />
    <div class="loading" style="display: none;">Loading&#8230;</div>
</body>
<script src='<%= Page.ResolveUrl("~/media/plugins/jquery/jquery.min.js") %>'></script>
<script src=" <%= Page.ResolveUrl("~/media/plugins/bootstrap/js/bootstrap.bundle.min.js") %>"></script>
<script src='<%= Page.ResolveUrl("~/media/plugins/toastr/toastr.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/Jquery/Datepicker.jquery.ui.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/plugins/sweetalert2/sweetalert2.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/media/Jquery/Common.js") %>'></script>
<script>
    $(document).ready(function (e) {
        fnGetPreviousStatus();
    })

    function fnGetPreviousStatus(e) {
        var pathname = window.location.pathname; // Returns path only (/path/example.html)
        var url = window.location.href;     // Returns full URL (https://example.com/path/example.html)
        var origin = window.location.origin;   // Returns base URL (https://example.com)
        var Url = pathname.split("/");
        var DepartmentID = '';
        var BasedOn = '';
        var Not_Ca_no = '';

        if (origin.indexOf("localhost") > -1) {
            if (Url.length == 7) {
                DepartmentID = Url[3];
                BasedOn = Url[5];
                Not_Ca_no = Url[6];
            }
        }
        else {
            if (Url.length == 8) {
                DepartmentID = Url[4];
                BasedOn = Url[6];
                Not_Ca_no = Url[7];
            }
        }

        $.ajax({
            type: "POST",
            url: "<%= Page.ResolveUrl("~/Appointment/home.aspx/CheckPreviousAppointments") %>",
            contentType: "application/json; charset=utf-8",
            data: '{"DepartmentID":"' + DepartmentID
                + '","BasedOn":"' + BasedOn
                + '","Noti_Ca_no":"' + Not_Ca_no + '" }',
            dataType: "json",
            beforeSend: function () {
                $(".loading").show();
            },
            success: function (msg) {
                if (msg.d != "") {

                    var Status = JSON.parse(msg.d).status;
                    var data = JSON.parse(msg.d).data;

                    if (Status === 200) {
                        if (data == "New Appointment") {
                            $('#CheckNotStatus').hide();
                            $('#SlotSection').show();
                            fnGetDepartmentDates();

                        } else {
                            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                            var today = new Date(data[0].Slot_Date);

                            var startTime = data[0].Slot_start_time.replace('AM', ' AM').replace('PM', ' PM');
                            var endTime = data[0].Slot_end_time.replace('AM', ' AM').replace('PM', ' PM');

                            $('#MobileNo').html(data[0].Mob_No);
                            $('#EmailID').html(data[0].Email_ID);
                            $('#SlotDate').html(today.toLocaleDateString("en-US", options));
                            $('#SlotTime').html(startTime + " - " + endTime);

                            $('#RescheduledDate').attr('process', data[0].ID)
                            $('#CancelDate').attr('process', data[0].ID)

                        }

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


    }


    $('#RescheduledDate').click(function (e) {
        var AppointmentID = $(this).attr('process');
        var Reschedule = "Y";
        $('#Reshedule').val(Reschedule);
        $('#Reshedule').attr('process', AppointmentID);
        $('#CheckNotStatus').hide();
        $('#SlotSection').show();
        fnGetDepartmentDates();
    });

    $('#CancelDate').click(function (e) {
        var AppointmentID = $(this).attr('process')
        if (confirm("Are you sure want to cancel the appointment.")) {
            $.ajax({
                type: "POST",
                url: "<%= Page.ResolveUrl("~/Appointment/home.aspx/CancelAppointment") %>",
                contentType: "application/json; charset=utf-8",
                data: '{"AppointmentID":"' + AppointmentID + '" }',
                dataType: "json",
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    if (msg.d != "") {

                        var Status = JSON.parse(msg.d).status;
                        var data = JSON.parse(msg.d).data;

                        if (Status === 200) {
                            SuccessAlert("Your appointment has been cancelled successfully.")

                            window.location.reload();
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
    });

    //Call the visible dates on load.
    //fnGetDepartmentDates();
    function fnGetDepartmentDates(e) {

        if ($('#Reshedule').val() == 'Y') {
            $('#Status').html('Dear Customer, Please select new slot for rescheduling of appointment.')
        }

        $.ajax({
            type: "POST",
            url: "<%= Page.ResolveUrl("~/Appointment/Home.aspx/GetDates") %>",
            contentType: "application/json; charset=utf-8",
            data: '',
            dataType: "json",
            beforeSend: function () {
                $(".loading").show();
            },
            success: function (msg) {
                if (msg.d != "") {
                    var Status = JSON.parse(msg.d).status;
                    var data = JSON.parse(msg.d).data;

                    var DatesData = "";
                    if (Status === 200) {

                        var checked = 0;
                        for (var i = 0; i < data.length; i++) {

                            var options = { weekday: 'long', year: 'numeric', month: 'short', day: 'numeric' };
                            var today = new Date(data[i].Slot_Date);

                            var checked_statement = '';

                            if (checked == i) {
                                checked_statement = "checked='true'"
                                getDateSlotsData(data[i].Slot_Date, today.toLocaleDateString("en-US", options));
                            }

                            DatesData = DatesData + "<label class='set'> <input type='radio' class='select_Date' date='" + data[i].Slot_Date + "' " + checked_statement + " name='select-date'> <div class='date-no'><span>" + today.toLocaleDateString("en-US", options) + "</span>  </div> </label>";
                        }
                        $('#Appointment_Dates').html("");
                        $('#Appointment_Dates').html(DatesData);
                        $('#appointment-day-slots').html('Select date for available slots');
                        $('.select_Date').click(function (e) {

                            var this_click = $(this);
                            var Date = this_click.attr('date');

                            //call the function of get slots available on particular dates.
                            getDateSlotsData(Date, this_click.parent().find('span').text());
                        })
                    }
                }
                else {
                    $('#Appointment_Dates').html("");
                    $('#Appointment_Dates').html("Slots Not Available.");
                    $('#appointment-day-slots').html('');
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

    function getDateSlotsData(Date, FullDate) {
        $.ajax({
            type: "POST",
            url: "<%= Page.ResolveUrl("~/Appointment/Home.aspx/GetSlotsData") %>",
            contentType: "application/json; charset=utf-8",
            data: '{"Date":"' + Date + '"}',
            dataType: "json",
            beforeSend: function () {
                $(".loading").show();
            },
            success: function (msg) {
                if (msg.d != "") {
                    var Status = JSON.parse(msg.d).status;
                    var data = JSON.parse(msg.d).data;

                    var SlotsData = "";
                    if (Status === 200) {
                        for (var i = 0; i < data.length; i++) {
                            var AppointmentLeft = '';
                            var AppointmentClass = 'BookAppointment';
                            var startTime = data[i].Slot_start_time.replace('AM', ' AM').replace('PM', ' PM');
                            var endTime = data[i].Slot_end_time.replace('AM', ' AM').replace('PM', ' PM');

                            if (data[i].Status == "Break") {
                                AppointmentClass = "Break";
                                AppointmentLeft = "Break";
                            } else {
                                if (parseInt(data[i].Appointments_Booked) > 0) {
                                    AppointmentLeft = parseInt(data[i].Appointments_Booked) + ' seats'
                                } else {
                                    AppointmentLeft = 'Booked';
                                    AppointmentClass = 'Booked';
                                }
                            }

                            SlotsData = SlotsData + ' <label class="set">  <input type="radio" Dep_Slot_Id = "' + data[i].ID + '" name="select-slot" class="' + AppointmentClass + '" /> <div class="date-no ' + AppointmentClass + '"><span>' + startTime + ' - ' + endTime + '</span>  </div>  <span style=" font-size: 12px; ">' + AppointmentLeft + '</span> </label>';
                        }
                        $('#appointment-day-slots').html('');
                        $('#appointment-day-slots').html(SlotsData);

                        $('.BookAppointment').click(function (e) {
                            BookSlot($(this).attr('Dep_Slot_Id'), $(this).parent().find('span').html(), FullDate);
                        })

                    }
                    else {
                        $('#appointment-day-slots').html('');
                        $('#appointment-day-slots').html('No Slots Available for <span> ' + FullDate + ' </span>');
                    }
                } else {
                    $('#appointment-day-slots').html('');
                    $('#appointment-day-slots').html('No Slots Available for <span style="font-size: 18px; color: black; font-weight: 500;"> ' + FullDate + ' </span>');
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

    function BookSlot(DepartmentSlotID, SlotTime, Date) {

        var Reschedule = 'N';
        var process = '0';
        if ($('#Reshedule').val() == 'Y') {
            Reschedule = $('#Reshedule').val();
            process = $('#Reshedule').attr('process');
            $('#txtEmailID').val($('#EmailID').html().trim());
            $('#txtMobile').val($('#MobileNo').html().trim());
        }
        $('#ConfirmAppointment').modal();

        $('#FormDetails').show();
        $('#AppointmentDetails').hide();
        $('#NextDetails').show();
        $('#CreateAppointent').hide();
        $('#NextDetails').click(function (e) {
            var Emailid = $('#txtEmailID').val();
            var MobileNo = $('#txtMobile').val();

            if (Emailid.length == 0) {
                ErrorAlert('Please enter Email ID.');
            }
            else if (!validateEmail(Emailid)) {
                ErrorAlert('Please enter Correct Email ID.');
            }
            else if (MobileNo.length == 0) {
                ErrorAlert('Please enter Mobile No.');
            }
            else {
                $('#FormDetails').hide();
                $('#AppointmentDetails').show();
                $('#App_slot_Date').html(Date);
                $('#App_slot_timing').html(SlotTime);
                $('#NextDetails').hide();
                $('#CreateAppointent').show();

                $('#CreateAppointent').click(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "<%= Page.ResolveUrl("~/Appointment/Home.aspx/BookUserApppointment") %>",
                        contentType: "application/json; charset=utf-8",
                        data: '{"Emailid":"' + Emailid + '","MobileNo":"' + MobileNo + '","DepartmentSlotID":"' + DepartmentSlotID + '","Reschedule":"' + Reschedule
                            + '","process":"' + process + '","SlotDate":"' + Date + '","SlotTime":"' + SlotTime + '"}',
                        dataType: "json",
                        beforeSend: function () {
                            $(".loading").show();
                        },
                        success: function (msg) {
                            if (msg.d != "") {
                                var Status = JSON.parse(msg.d).status;
                                var data = JSON.parse(msg.d).data;

                                var DatesData = "";
                                if (Status === 200) {
                                    $('#ConfirmAppointment').modal('hide');

                                    SuccessAlertMiddle("Dear Customer, your appointment for date " + $('#App_slot_Date').html() + " & slot timing : " + $('#App_slot_timing').html() + " has been successfully scheduled. Please be on time.")

                                    setTimeout(function (e) {
                                        window.location.reload();
                                    }, 6000)
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
                })
            }
        })

    $('.closeModal').click(function (e) {
        $('#ConfirmAppointment').modal('hide');
    })
}

function validateEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test($email);
}
$('.hover-arrow').click(function (e) {
})
</script>
</html>
