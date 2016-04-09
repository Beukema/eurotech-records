$(document).ready(function(){

  $(document).on('click', '.item-uploads .fa-camera', function(){
    $(this).siblings('.item-upload-photo').find('#file').click();
  });

  $(document).on('click', '.item-uploads .fa-paperclip', function(){
    $(this).siblings('.item-upload-text').find('#file').click();
  });

  $(document).on('change', '.item-uploads #file', function(){
    $(this).siblings('input[type=submit]').click();
    $(this).parent().siblings('.fa-camera').removeClass('fa-camera').addClass('fa-spinner');
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


  var modal = function(){

    var init = function(){
      $('.modal-close').on('click', function(){
        close();
      });
    }

    var open = function(content){
      $('.modal-box-content').append(content);
      $('.modal').removeClass('modal-hidden');
    }

    var close = function(){
      $('.modal').addClass('modal-hidden');
      $('.modal-box-content').children().remove()
    }

    return {
      init: init,
      open: open
    }
  }();

  modal.init();

  $('.repair-order-upload-image').on('click', function(){
    modal.open('<img src="' + $(this).attr('src') + '">');
  })

  $('.text-upload-open').on('click', function(e){
    e.preventDefault()
    modal.open($(this).siblings('.text-upload').html())
  })

});
