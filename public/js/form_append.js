$(function () {
    $('#append').click(function () {
        $('#append_area').append('<div><input type="text" name="field[]"><input type="button" class="remove" value="remove"></div>');
    });
    $(document).on('click','.remove',function () {
        $(this).parent().remove();
    });
});
