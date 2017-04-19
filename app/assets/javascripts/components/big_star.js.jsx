const BigStar = React.createClass({

  formattedRating: function(rating) {
    var formattedRating = 0

    if ( rating != "n/a" ) {
      formattedRating = rating.toFixed(1)
    } else {
      formattedRating = "n/a"
    }

    return formattedRating
  },

  getClassName: function() {
    if (this.props.view === "show") {
      return "big-star-show"
    } else {
      "big-star"
    }
  },

  render: function() {
    return (
      <div className={this.props.style}>
        <span><img className='big-star-show' src="/assets/big-star.png"></img><span className='score'>{this.formattedRating(this.props.rating)}</span></span>
      </div>
    )
  }
})
