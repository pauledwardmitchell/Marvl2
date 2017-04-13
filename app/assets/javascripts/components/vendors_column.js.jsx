const VendorsColumn = React.createClass({

  emptyColumn: function() {
    return(
      <div className="cell-container-right">
      </div>
    )
  },

  allVendors: function() {
    return(
      <div className="cell-container-right">

        <h2>Vendors in Selected Category</h2>

        {this.props.displayedVendors.map(function(vendor) {
          return <h4 key={vendor.id}>{vendor.name}</h4>
          }
        )}
      </div>

    )
  },

  renderColumn: function() {
    if (this.props.displayedVendors.length === 0) {
      return this.emptyColumn()
    } else {
      return this.allVendors()
    }
  },

  render: function() {
    return this.renderColumn()
  }

})
