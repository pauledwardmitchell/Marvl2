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

### name servers

[digitalocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean)

our do server dns records

```
Zone File
$ORIGIN coopshopdbc.com.
$TTL 1800
coopshopdbc.com. IN SOA ns1.digitalocean.com. hostmaster.coopshopdbc.com. 1475102897 10800 3600 604800 1800
coopshopdbc.com. 1800 IN NS ns1.digitalocean.com.
coopshopdbc.com. 1800 IN NS ns2.digitalocean.com.
coopshopdbc.com. 1800 IN NS ns3.digitalocean.com.
coopshopdbc.com. 1800 IN A 45.55.84.132
www.coopshopdbc.com. 1800 IN A 45.55.84.132
```

