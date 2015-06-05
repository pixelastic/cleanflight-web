// ----------------------------------------------
// Common application
// ----------------------------------------------
$(function () {
  var $q = $('#search');

  // hack to force autocomplete='off' on Chrome
  var hackTimeout = setTimeout(function() {
    $q.attr('autocomplete', 'off');
    clearTimeout(hackTimeout);
  }, 0);

  // typeahead.js initialization
  $('#search').typeahead({hint: false}, {
    source: index.ttAdapter({hitsPerPage: 5}),
    displayKey: 'title',
    templates: {
      suggestion: function(hit) {
        // render the hit
        return '<div class="hit">' +
          '<div class="name">' +
            hit._highlightResult.title.value +
          '</div>' +
        '</div>';
      }
    }
  }).on('typeahead:selected', function(event, suggestion, dataset) {
    location.href = window.baseUrl + suggestion.url;
  }).focus;;
});