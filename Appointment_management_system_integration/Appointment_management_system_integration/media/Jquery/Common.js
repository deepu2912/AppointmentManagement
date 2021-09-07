///Common Alert Function

var Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 5000
});

var Toast2 = Swal.mixin({
    toast: true,
    //position: 'top-end',
    showConfirmButton: true,
    timer: 7000
});

function ErrorAlert(message) {
    Toast.fire({
        icon: 'error',
        title: message
    })
}
function ErrorAlertMiddle(message) {
    Toast2.fire({
        icon: 'error',
        title: message
    })
}

function SuccessAlert(message) {
    Toast.fire({
        icon: 'success',
        title: message
    })
}

function SuccessAlertMiddle(message) {
    Toast2.fire({
        icon: 'success',
        title: message
    })
}
function WarningAlert(message) {
    Toast.fire({
        icon: 'warning',
        title: message
    })
}

