
const NewVendorForm = React.createClass({

  getInitialState: function() {
  	return {
      vendorName: ''	
  	}
  },

  handleChange: function(event) {
    this.setState({vendorName: event.target.value});
  },

  render: function() {
  	let vendorSearch
  	if (this.state.vendorName.length > 1) {
  	  vendorSearch = <div><VendorWarning vendorName={this.state.vendorName} vendors={this.props.data} /></div>
  	} else {
  	  vendorSearch = <div></div>
  	}

	return(
		<div>
		  <div>
		    {vendorSearch}
		  </div>

		  <center>
	        <h1>Add a New Vendor</h1>
          </center>

		  <div>
            <form className="form-group" id="new_vendor" action="/vendors" method="post">
              <input name="utf8" type="hidden" value="&#x2713;" />
              <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />

              <label>Name</label>
              <input onChange={this.handleChange} type="text" name="vendor[name]" id="vendor_name" />

              <input type="submit" value="Submit Vendor" /> 
            </form>
		  </div>
      </div>
	)
  }
})


