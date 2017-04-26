const ActiveUserRow = React.createClass({

  getInitialState: function() {
    return {
      active: this.ifActive()
    }
  },

  ifActive: function(user_status) {
    if (user_status === 'inactive') {
      return 'inactive'
    } else {
      return 'active'
    }
  },

  buttonText: function() {
    if (this.state.active === 'inactive') {
      return 'Activate'
    } else {
      return 'Deactivate'
    }
  },

  // handleClick: function(e) {
  //   e.preventDefault()

  //   var data = { status: 'inactive' }

  //   $.ajax({
  //     method: 'PATCH',
  //     url: '/users/' + this.props.user.user_id,
  //     dataType: 'JSON',
  //     data: { record: data },
  //     success: function(data) {
  //       this.setState({ active: 'inactive' });
  //     }.bind(this)
  //   });
  // },

  render: function() {
    return(
      <tr>
        <td>{this.props.user.user_organisation}</td>
        <td>{this.props.user.user_name}</td>
        <td>{this.ifActive(this.state.active)}</td>
        <td>
          <form action={'/users/'+this.props.user.user_id} method="post">
            <input type="hidden" name="_method" value="put"/>
            <input type="hidden" name="user[status]" value="inactive"/>
            <input type="hidden" name='authenticity_token' value={this.props.authenticity_token}/>
            <input type="submit" value="Deactivate"/>
          </form>

        </td>
      </tr>
    )
  }

})
