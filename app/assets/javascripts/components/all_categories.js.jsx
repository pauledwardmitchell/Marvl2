const AllCategories = React.createClass({

  getInitialState: function() {
    return {

    }

  },

  render: function() {
    return(
      <div>
        {this.props.data.categories.map((category) => {
          return <p>{category.name}</p>
        }
        )}
      </div>
    )
  }



})
