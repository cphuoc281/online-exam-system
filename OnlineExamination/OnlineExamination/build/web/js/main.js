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


//    const questionNumberInput = document.getElementById('questionNumber');
//    const errorMsg = '<%= request.getAttribute("errorMsg") %>';
//    if (errorMsg === 'questionLimitExceeded') {
//        var errorMessage = "Số câu hỏi yêu cầu vượt quá số câu hỏi có trong môn học";
//        questionNumberInput.setCustomValidity(errorMessage);
//
//    }

        
    


       

        










})(jQuery);
