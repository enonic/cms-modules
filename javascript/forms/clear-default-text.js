$(function() {
    initFormInputClearDefaultText();
});

// clears default input text on focus (i.e. search input)
// default text should be set on "title" attribute
function initFormInputClearDefaultText() {
    $('input[title]').each(function() {
        if ($(this).val().length === 0) {
            $(this).val($(this).attr('title'));
        }
    }).focus(function() {
        if ($(this).val() === $(this).attr('title')) {
            $(this).val(null);
        }
    }).focusout(function() {
        if ($(this).val().length === 0) {
            $(this).val($(this).attr('title'));
        }
        if ($(this).val() !== $(this).attr('title')) {
            $(this).addClass('modified');
        }
        else {
            $(this).removeClass('modified');
        }
    });
}