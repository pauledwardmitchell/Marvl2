
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
	return(
		<div>
        <form className="form-group" id="new_vendor" action="/vendors" method="post">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />

          <label>Name</label>
          <input onChange={this.handleChange} type="text" name="vendor[name]" id="vendor_name" />

          <input type="submit" value="Submit Vendor" /> 
        </form>
        <VendorWarning vendorName={this.state.vendorName} vendors={this.props.data} />
      </div>
	)
  }
})


