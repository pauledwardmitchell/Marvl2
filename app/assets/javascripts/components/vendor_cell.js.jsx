const VendorCell = React.createClass({

  formattedReviewsNoun: function(num_reviews) {
    if (num_reviews === 1) {
      return 'review'
    } else {
      return 'reviews'
    }
  },

  // formattedRating: function(rating) {
  //   var formattedRating = 0

  //   if ( rating != "n/a" ) {
  //     formattedRating = rating.toFixed(1)
  //   } else {
  //     formattedRating = "n/a"
  //   }

  //   return formattedRating
  // },

  render: function() {
    return(
      <div className='cell'>
        <div className='text-container'>

          <div className='title'>
            <a href={'/vendors/'+this.props.vendor.vendor_id}>{this.props.vendor.vendor_name}</a>
          </div>

          <div className='sub-title'>
            <span>{this.props.vendor.vendor_reviews_count} {this.formattedReviewsNoun(this.props.vendor.vendor_reviews_count)}</span>
          </div>

        </div>

        <div className="right-container">
          <div className="right-decorator">
            <BigStar rating={this.props.vendor.vendor_avg_rating}/>
          </div>
        </div>

      </div>
    )
  }

})
