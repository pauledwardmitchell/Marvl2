$('a#logout_link').on('click', function(){
        event.preventDefault();
        $.ajax({
          url: '/logout',
          method: 'DELETE'
        })
      });
      $('#star').raty({
        starOn: '<%= image_path('star-on.png') %>',
        starOff: '<%= image_path('star-off.png') %>',
        path: '',
        scoreName: 'star',
        space: true 
      });
      $('.star-rating').raty({
        starOn: '<%= image_path('star-on.png') %>',
        starOff: '<%= image_path('star-off.png') %>',
        path: '',
        readOnly: true,
        scoreName: 'vendor rating',
        score: function () {
          return $(this).attr('data-score');
        }
      });