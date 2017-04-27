const DeactivateUsersPanel = React.createClass({


  render: function() {
    return(
      <div>
        <h2>Manage User Activation</h2>

        <table>
          <thead>
            <tr>
              <th>Organisation</th>
              <th>Name</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {this.props.data.user_hashes.map((user) => {
              return <ActiveUserRow
                      key={user.id}
                      user={user}
                      authenticity_token={this.props.authenticity_token} />
             }
             )}
          </tbody>
        </table>

      </div>
    )
  }

})
