import React, { Component } from 'react';

class AddBar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      Expense: '',
      Category: '',
      Cost: '',
      Month: this.props.month,
    };
  }

  render() {
    return (
      <form>

        <input
          value={this.state.month}
          onChange={this._updateMonth}
        />

        <input
          value={this.state.Expense}
          placeholder="subway, credit card payment, etc."
          onChange={this._updateExpense}
        />

        <input
          value={this.state.Category}
          placeholder="Transport, Utilities, etc."
          onChange={this._updateCategory}
        />

        <input
          value={this.state.Cost}
          placeholder="$10 (enter number only)"
          onChange={this._updateCost}
        />

        <button onClick={this._doSubmit}>+</button>
        {/* <input type="submit" /> */}

      </form>
    );
  }

  _doSubmit = (e) => {
    e.preventDefault();
    this.props.handleSubmit(this.state);
    this._resetAddBar();
  }

  _resetAddBar = () => {
    this.setState({
      Expense: '',
      Category: '',
      Cost: '',
      Month: this.props.month,
    });
  }

  _updateExpense = (e) => {
    this.setState({
      Expense: e.target.value
    });
  }

  _updateCategory = (e) => {
    this.setState({
      Category: e.target.value
    });
  }

  _updateCost = (e) => {
    this.setState({
      Cost: parseFloat(e.target.value)
    });
  }

  _updateMonth = (e) => {
    this.setState({
      Month: e.target.value
    });
  }
}

export default AddBar;
