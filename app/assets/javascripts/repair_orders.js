$(document).ready(function(){
  $(document).on('click', '.add-item-button', function(e){
    e.preventDefault();
    var itemCount = $('.item').length
    
    markup = '<div class="item well">' +
      '<div class="form-group"><label for="repair_order_items_attributes_' + itemCount + '_cause">Cause</label>' +
      '<textarea class="form-control" type="text" name="repair_order[items_attributes][' + itemCount + '][cause]" id="repair_order_items_attributes_' + itemCount + '_cause"></textarea></div>' +
      '<div class="form-group"><label for="repair_order_items_attributes_' + itemCount + '_correction">Correction</label>' +
      '<textarea class="form-control" type="text" name="repair_order[items_attributes][' + itemCount + '][correction]" id="repair_order_items_attributes_' + itemCount + '_correction"></textarea></div>' +
      '<div class="form-group"><label for="repair_order_items_attributes_' + itemCount + '__destroy">Remove Item</label>' +
      '<input name="repair_order[items_attributes][' + itemCount + '][_destroy]" type="hidden" value="0"><input type="checkbox" value="' + itemCount + '" name="repair_order[items_attributes][' + itemCount + '][_destroy]" id="repair_order_items_attributes_' + itemCount + '__destroy"></div>' +
    '</div>'
    
    
    $('.item-list').append(markup);
    $('.item').last().find('textarea').first().focus()
  });
});