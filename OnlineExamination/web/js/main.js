(function ($) {

    "use strict";

    var fullHeight = function () {

        $('.js-fullheight').css('height', $(window).height());
        $(window).resize(function () {
            $('.js-fullheight').css('height', $(window).height());
        });

    };
    fullHeight();

    $(".toggle-password").click(function () {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
    const password = document.getElementById("password")
            , confirm_password = document.getElementById("confirm_password");

    function validatePassword() {
        if (password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

    /*==================================================================
     [ Focus Contact2 ]*/

//    const phoneInput = document.getElementById('phone');
//    const errorElement = document.getElementById('phone-error');
//
//    phoneInput.addEventListener('input', function () {
//        if (this.value.length < 9) {
//            errorElement.innerText = 'The format of this phone number is not recognized.';
//        } else {
//            errorElement.innerText = '';
//        }
//    });

    // Lấy giá trị username đã nhập
    // Lấy giá trị username đã nhập 
    






})(jQuery);
