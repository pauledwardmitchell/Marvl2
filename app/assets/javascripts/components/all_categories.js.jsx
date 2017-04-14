const AllCategories = React.createClass({

  getInitialState: function() {
    return {
      displayedVendors: [],
      selectedCategory: '',
      selectedCategoryVendorHashes: []
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

  getClickedCategoryName: function(category_id) {
    var categories = this.props.data.categories

    for (i = 0; i < categories.length; i++) {
      if (categories[i].id === category_id) {
        return categories[i].name
      }
    }
  },

  getClickedCategoryVendorHashes: function(vendorIds_array) {
    var clickedCategoryVendorHashes = []
    var allVendorHashes = this.props.data.vendor_hashes

    for (i = 0; i < allVendorHashes.length; i++) {
      if (vendorIds_array.includes(allVendorHashes[i].vendor_id)) {
        clickedCategoryVendorHashes.push(allVendorHashes[i])
      }
    }

    return clickedCategoryVendorHashes
  },

  setCategoryVendors: function(category_id) {
    var offeringsForGivenCategoryId = []
    var clickedCategoryVendorsIds = []
    var clickedCategoryVendors = []
    var clickedCategoryVendorHashes = []
    var offerings = this.props.data.offerings
    var clickedCategory = ''

    for (i = 0; i < offerings.length; i++) {
      if (offerings[i].category_id === category_id) {
        offeringsForGivenCategoryId.push(offerings[i])
      }
    }

    clickedCategoryVendorsIds = this.getVendorIdsFromOfferingsArray(offeringsForGivenCategoryId)

    clickedCategoryVendors = this.getVendorsFromVendorsIdsArray(clickedCategoryVendorsIds)

    clickedCategory = this.getClickedCategoryName(category_id)

    clickedCategoryVendorHashes = this.getClickedCategoryVendorHashes(clickedCategoryVendorsIds)

    this.setState({ displayedVendors: clickedCategoryVendors })
    this.setState({ selectedCategory: clickedCategory })

    this.setState({ selectedCategoryVendorHashes: clickedCategoryVendorHashes })

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

        <VendorsColumn vendorHashes={this.state.selectedCategoryVendorHashes} selectedCategory={this.state.selectedCategory} displayedVendors={this.state.displayedVendors}/>
      </div>
    )
  }



})
