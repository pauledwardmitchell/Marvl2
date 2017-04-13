const VendorCell = React.createClass({

  render: function() {
    return(
      <div className='cell'>
        <div className='text-container'>

            <div className='title'><a href={'/vendors/'+this.props.vendor.id}>{this.props.vendor.name}</a></div>
            <div className='sub-title'>5 reviews</div>
        </div>
      </div>
    )
  }

})
