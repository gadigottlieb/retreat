// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready;
ready = function() {

  console.log('ready!');
  $('body').on('click', '.close', closeModal);
  $('#timeline').on('click', '.log-trip', loadNewGetaway);
  $('#timeline').on('click', '.read-more', loadShowGetaway);
  $('body').on('click', '.getaway-photo', changeActivityPhoto);

  changeBackgroundImage();
  googlePlacesAutocomplete();

};

$(document).ready(ready);
$(document).on('page:load', ready);

var autocomplete;

function loadNewGetaway() {
  location.href = '/getaways/new';
}

function loadShowGetaway() {
  var getawayID = $(this).closest('.timeline-block').data('id');
  location.href = '/getaways/' + getawayID;
}

function changeActivityPhoto() {
  var photo = $(this);
  $.ajax('/activities/'+ photo.data('activityid') +'/update_photo', {
    type: 'PUT',
    data: {photo_id: photo.data('photoid')}
  }).done(function(data) {
    $('.modal').hide();
    $('#activity_'+ data.id).find('img').attr('src', data.image_url);
  });
}

function googlePlacesAutocomplete() {

  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      { types: ['(cities)'] });
  // When the user selects an address from the dropdown,
  // populate the address fields in the form.

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var textField = $('#autocomplete');
    var placeArray = textField.val().split(', ');
    textField.replaceWith('<p>'+ textField.val() +'</p>');

    var hiddenFieldCity = $('<input type="hidden" name="getaway[city]" value="'+ placeArray[0] +'" >');
    var hiddenFieldCountry = $('<input type="hidden" name="getaway[country]" value="'+ placeArray[1] +'" >');

    $('#new-getaway-date-form').prepend(hiddenFieldCountry);
    $('#new-getaway-date-form').prepend(hiddenFieldCity);

    $('p#date-placeholder').hide();
    $('#departure-date-div').show();

    $('#comment-placeholder').hide();
    $('#comment-div').show();

    $('#new-getaway-date-form').append('<input type="submit" value="Save Trip">');

  });
}

function changeBackgroundImage() {
  var tripHeader = $('.trip-header')
  var photoUrl = tripHeader.data('randomphotourl');

  if (photoUrl !== 'none') {
    tripHeader.css('background-image', 'url("'+ photoUrl +'")');
  }
}

function closeModal() {
  $(this).remove();
  $('.modal').hide();
}
