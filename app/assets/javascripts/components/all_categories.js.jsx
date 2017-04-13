const AllCategories = React.createClass({

  getInitialState: function() {
    return {
      displayedVendors: [],
      selectedCategory: ''
    }

  },

  getVendorIdsFromOfferingsArray: function(offerings_array) {
    var vendorIdsArray = offerings_array.map(function(offering) {
      return offering.vendor_id
    })

    return vendorIdsArray
  },

  getVendorsFromVendorsIdsArray: function(vendorIds_array) {
    var vendors = this.props.data.vendors
    var clickedCategoryVendors = []

    for (i = 0; i < vendors.length; i++) {
      if (vendorIds_array.includes(vendors[i].id)) {
        clickedCategoryVendors.push(vendors[i])
      }
    }

    return clickedCategoryVendors
  },

  setCategoryVendors: function(category_id) {
    var offeringsForGivenCategoryId = []
    var clickedCategoryVendorsIds = []
    var clickedCategoryVendors = []
    var offerings = this.props.data.offerings

    for (i = 0; i < offerings.length; i++) {
      if (offerings[i].category_id === category_id) {
        offeringsForGivenCategoryId.push(offerings[i])
      }
    }

    clickedCategoryVendorsIds = this.getVendorIdsFromOfferingsArray(offeringsForGivenCategoryId)

    clickedCategoryVendors = this.getVendorsFromVendorsIdsArray(clickedCategoryVendorsIds)

    this.setState({ displayedVendors: clickedCategoryVendors })

  },

  render: function() {
    return(
      <div>
        <div className='vendors-column-container' >
          <h2>Click a Category</h2>
          {this.props.data.categories.map((category) => {
            return <CategoryButton
                     key={category.id}
                     category={category}
                     setVendors={this.setCategoryVendors}/>
          }
          )}
        </div>

        <VendorsColumn selectedCategory={this.state.selectedCategory} displayedVendors={this.state.displayedVendors}/>
      </div>
    )
  }



})
