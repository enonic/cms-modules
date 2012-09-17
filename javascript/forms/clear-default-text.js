$(function() {
    initFormInputClearDefaultText();
});

// clears default input text on focus (i.e. search input)
// default text should be set on "value" and "data-default-text" attributes
function initFormInputClearDefaultText() {
    $('input[data-default-text]').focus(function() {
        if ($(this).val() === $(this).data('default-text')) {
            $(this).val(null);
        }
    }).focusout(function() {
        if ($(this).val().length === 0) {
            $(this).val($(this).data('default-text'));
        }
        if ($(this).val() !== $(this).data('default-text')) {
            $(this).addClass('modified');
        }
        else {
            $(this).removeClass('modified');
        }
    });
}