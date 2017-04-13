const VendorsColumn = React.createClass({

  emptyColumn: function() {
    return(
      <div className="cell-container-right">
        <center>
          <a href='/vendors/new'><h4>Add a vendor now!</h4></a>
        </center>
      </div>
    )
  },

  allVendors: function() {
    return(
      <div className="cell-container-right">

        <h2>Vendors in Selected Category</h2>

        {this.props.displayedVendors.map(function(vendor) {
          return <VendorCell
                   key={vendor.id}
                   vendor={vendor} />

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
