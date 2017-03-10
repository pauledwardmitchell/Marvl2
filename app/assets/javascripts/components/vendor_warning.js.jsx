
const VendorWarning = React.createClass({

	render: function() {
		return(
		  <div className='admin-tools'>
            <h3>'Vendors Already in MARVL'</h3>
            <ul> 
              {this.props.vendors
              	.filter((vendor) => `${vendor.name}`.toUpperCase().indexOf(this.props.vendorName.toUpperCase()) >= 0)
              	.map((vendor) => {
              	  return (
                    <li><a href={`/vendors/${vendor.id}`}>{vendor.name}</a></li>
              	  )
              	})} 
            </ul>
          </div>
		)
	}
})