$(document).ready(function() {
  $('#banktransfer_instructions').click(function(event) {
    newwindow = window.open($(this).attr('href'), 'bank transfer', 'left=20,top=20,width=500,height=500,toolbar=0,resizable=0,scrollbars=1');
    if (window.focus) {
      newwindow.focus();
    }
    return false;
  });
});