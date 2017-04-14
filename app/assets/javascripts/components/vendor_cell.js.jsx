const VendorCell = React.createClass({

  render: function() {
    return(
      <div className='cell'>

        <div className='text-container'>

            <div className='title'><a href={'/vendors/'+this.props.vendor.id}>{this.props.vendor.name}</a></div>
            <div className='sub-title'>

              <span>5 reviews | </span>
              <span><img className='star' src="/assets/big-star.png"></img> 4.6 out of 5</span>

            </div>
        </div>

        <div className="right-container">
          <div className="right-decorator">
            <div>
            </div>
          </div>
        </div>

      </div>
    )
  }

})
