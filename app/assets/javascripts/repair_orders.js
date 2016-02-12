$(document).ready(function(){
  $('.app-master-text').on('input', function(){
    $('.app-mimic-text input[type=search]').val($(this).val())
  });
  
  $(document).on('click', '.add-item-button', function(e){
    e.preventDefault();
    var itemCount = $('.item').length
    
    causeFields = '<label for="repair_order_items_attributes_' + itemCount + '_cause">Cause</label>' +
      '<textarea class="form-control" type="text" name="repair_order[items_attributes][' + itemCount + '][cause]" id="repair_order_items_attributes_' + itemCount + '_cause"></textarea>'
    
    correctionFields = '<label for="repair_order_items_attributes_' + itemCount + '_correction">Correction</label>' +
      '<textarea class="form-control" type="text" name="repair_order[items_attributes][' + itemCount + '][correction]" id="repair_order_items_attributes_' + itemCount + '_correction"></textarea>'
    
    deleteCheckbox = '<label for="repair_order_items_attributes_' + itemCount + '__destroy">Remove Item</label>' +
      '<input name="repair_order[items_attributes][' + itemCount + '][_destroy]" type="hidden" value="0"><input type="checkbox" value="' + itemCount + '" name="repair_order[items_attributes][' + itemCount + '][_destroy]" id="repair_order_items_attributes_' + itemCount + '__destroy">'
    
    uploads = '<div class="item-uploads"><span class="item-upload-field"><i class="fa fa-camera"></i><i class="fa fa-paperclip"></i></span></div>'
    
    markup = '<div class="item"><div class="form-group"><div class="item-inputs">' + causeFields + '</div>' + '</div>' +
              '<div class="form-group"><div class="item-inputs">' + correctionFields + '</div>' + '</div>' + 
              '<div class="form-group delete-item">' + deleteCheckbox + '</div></div>'
    
    
    $('.item-list').append(markup);
    $('.item').last().find('textarea').first().focus()
  });
});