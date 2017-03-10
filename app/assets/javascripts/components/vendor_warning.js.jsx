
const VendorWarning = React.createClass({

	render: function() {
		return(
		  <div className='vendor-box'>
            <h5>Vendors in MARVL that match your search:</h5>
            <ul> 
              {this.props.vendors
              	.filter((vendor) => `${vendor.name}`.toUpperCase().indexOf(this.props.vendorName.toUpperCase()) >= 0)
              	.map((vendor) => {
              	  return (
                    <li key={vendor.id}><a href={`/vendors/${vendor.id}`}>{vendor.name}</a></li>
              	  )
              	})} 
            </ul>
          </div>
		)
	}
})