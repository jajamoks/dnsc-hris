(function() {

    $('.input-group.date').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });

    $("input[name='employee_birthday']").datepicker({
        endDate: '-18y',
        format: 'yyyy-mm-dd'
    });

    $('.remove').on('click', function(event) {
        var inputBoxParent = $(this).parents('.parent').last().parents('.panel-body').first();
        var inputBoxCount = inputBoxParent.children('.parent').length;
        if (inputBoxCount > 1) {
            $(this).parents('.parent').last().remove();
        } else {
            inputBoxParent.children('.parent').find(':input').val('');
        }
    });

    $('.add-field').on('click', function(event) {
        event.preventDefault();
        var cloneElement = $(this).attr('data-target');
        var appendToElement = $(this).attr('data-append');
        cloneElements(cloneElement, appendToElement);
    });

    $('.finish').on('click', function(event) {
        $.niftyNoty({
            type: 'success',
            container: 'page',
            html: 'Please wait for a moment. We are writing your Personal Data Sheet. This might take a while depending on your internet connection.',
            timer: 5000
        });
    });

    $('#personal-data-sheet').bootstrapWizard({
        tabClass: 'wz-classic',
        nextSelector: '.next',
        previousSelector: '.previous',
        onTabClick: function(tab, navigation, index) {
            isValid = null;
            $('#pds-form').bootstrapValidator('validate');
            if (isValid === false) {
                return false;
            }
        },
        onInit: function() {
            $('#personal-data-sheet').find('.finish').hide().prop('disabled', true);
        },
        onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = ($current / $total) * 100;
            var wdt = 100 / $total;
            var lft = wdt * index;
            $('#personal-data-sheet').find('.progress-bar').css({
                width: $percent + '%'
            });
            // If it's the last tab then hide the last button and show the finish instead
            if ($current >= $total) {
                $('#personal-data-sheet').find('.next').hide();
                $('#personal-data-sheet').find('.finish').show();
                $('#personal-data-sheet').find('.finish').prop('disabled', false);
            } else {
                $('#personal-data-sheet').find('.next').show();
                $('#personal-data-sheet').find('.finish').hide().prop('disabled', true);
            }
        },
        onNext: function() {
            isValid = null;
            $('#pds-form').bootstrapValidator('validate');
            if (isValid === false) {
                return false;
            }
        }
    });

    var isValid;
    $('#pds-form').bootstrapValidator({
        message: 'This value is not valid',
        container: 'tooltip'
            // fields: {
            //     employee_photo: {
            //         message: 'Please choose your photo'
            //     }
            // }
    }).on('success.field.bv', function(e, data) {
        var $parent = data.element.parents('.form-group');

        // Remove the has-success class
        $parent.removeClass('has-success');
    }).on('error.form.bv', function(e) {
        isValid = false;
    });

    // Initialize Masked Inputs
    // a - Represents an alpha character (A-Z,a-z)
    // 9 - Represents a numeric character (0-9)
    // * - Represents an alphanumeric character (A-Z,a-z,0-9)
    $('#cellphone_number').mask('09999999999');

    function cloneElements(cloneElement, appendToElement) {
        var clone = $(cloneElement).last().clone(true);
        clone.addClass('animated flipInX');
        clone.find(':input').val('');
        clone.prependTo($(appendToElement).find('.panel-body'));
    }

})();
