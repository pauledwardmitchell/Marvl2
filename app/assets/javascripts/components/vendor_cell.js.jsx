const VendorCell = React.createClass({

  render: function() {
    return(
      <div className='cell'>

        <div className='text-container'>

            <div className='title'><a href={'/vendors/'+this.props.vendor.id}>{this.props.vendor.name}</a></div>
            <div className='sub-title'>
              <span>5 reviews | </span>
              <span><img className='little-star' src="/assets/big-star.png"></img><span>4.6</span></span>



            </div>
        </div>

        <div className="right-container">
          <div className="right-decorator">
            <div>
              <span><img className='big-star' src="/assets/big-star.png"></img><span className='score'>4.6</span></span>
            </div>
          </div>
        </div>

      </div>
    )
  }

})
