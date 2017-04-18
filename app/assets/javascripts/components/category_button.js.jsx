const CategoryButton = React.createClass({

  onClick: function() {
    this.handleClick(this.props.category.id)
  },

  handleClick: function(id) {
    this.props.setVendors(id)
  },

  render: function() {
    return(
      <div onClick={this.onClick}>
        <h4>{this.props.category.name}</h4>
      </div>
    )
  }
})
