# research

http://guides.rubyonrails.org/routing.html#using-root

## generate join table

`rails g migration CreateJoinTableCustomerProduct customer product`

## rails namespaces

[rails blog from thoughtbot metis bootcamper](http://blog.roberteshleman.com/2014/08/14/using-rails-namespaces-for-admin-actions/)

t.date :membership_expiration

## ajax example

```javascript
  $("a.delete").on("click", function() {
    event.preventDefault();

    $.ajax({
      url: $(this).attr('href'),
      method: "delete"
    }).done(function( data ) {
      $('article#' + data).remove();
    });
  });
```

controller:

```ruby
  def create
    if request.xhr?
      render json: params[:user_id]
    end
  end
```
