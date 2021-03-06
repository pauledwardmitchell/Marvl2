const VendorsColumn = React.createClass({

  emptyColumn: function() {
    return(
      <div className="cell-container-right">
        <center>
          <h4>Can&apos;t find the Vendor you are looking for?</h4>
          <a href='/vendors/new'><h4>Add a vendor now!</h4></a>
          <h4>Can&apos;t find the Category you are looking for?</h4>
          <h4>Email your idea to paul@cpa.coop!</h4>
        </center>
      </div>
    )
  },

  emptyColumnPrompt: function() {
    return(
      <div className="cell-container-right">
        <center>
          <h4>MARVL has no vendors for this category.</h4>
          <br></br>
          <h4>Be the first to add a vendor in this category!</h4>
          <a href='/vendors/new'><h4>Add your vendor now!</h4></a>
          <br></br>
          <h4>Can&apos;t find the Category you are looking for?</h4>
          <h4>Email your idea to paul@cpa.coop!</h4>
        </center>
      </div>
    )
  },

  allVendors: function() {
    return(
      <div className="cell-container-right">
        <center>
          <h2>{this.props.selectedCategory} Vendors</h2>
        </center>

        {this.props.vendorHashes.map(function(vendor) {
          return <VendorCell
                   key={vendor.vendor_id}
                   vendor={vendor} />

          }
        )}
      </div>

    )
  },

  renderColumn: function() {
    if (this.props.selectedCategory === '') {
      return this.emptyColumn()
    }
    if (this.props.displayedVendors.length === 0) {
      return this.emptyColumnPrompt()
    } else {
      return this.allVendors()
    }
  },

  render: function() {
    return this.renderColumn()
  }

})
