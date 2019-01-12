import React, { Component } from 'react';
import './App.css';
import CurrentMonth from './CurrentMonth';
import TopThree from './Top3Expenses';
import MonthPieChart from './PieChart';
import AddBar from './AddBar';
import ExpenseTable from './ExpenseTable';
import PageButtons from './Pagination';

class App extends Component {
  constructor(props) {
    super(props);
    this.monthNames = {
      "1": "January",
      "2": "February",
      "3": "March",
      "4": "April",
      "5": "May",
      "6": "June",
      "7": "July",
      "8": "August",
      "9": "September",
      "10": "October",
      "11": "November",
      "12": "December"
    }

    this.state = {
        month: '',
        expenses: [],
        categories: [],
        categoricalData: [],
    }

    this._handleClick = this._handleClick.bind(this);
  }

  _handleClick(e) {
    e.preventDefault();
    console.dir(e);
  }

  async componentDidMount() {
    const data = await fetch('./Frontend/sample_data.json').then(r => r.json());
    const categoricalData = await fetch('https://raw.githubusercontent.com/alexrogers823/interactiveBarGraph/master/CategoryWords.json').then(r => r.json());
    const monthData = data;
    console.log(monthData);
    const monthName = this.monthNames[monthData.Month];

    this.setState({
      month: monthName,
      expenses: Object.keys(monthData),
      categories: [...new Set(categoricalData.Keywords.map(n => n.Category))],
      categoricalData: categoricalData.Keywords,
    })
  }

  render() {
    // console.log(this.state.expenses);
    return (
      <div>

        <div className="Header">
          <header>Green Orchard</header>
        </div>

        <div className="App">

          <div className="CurrentMonthAndTopThree">
            <CurrentMonth title={this.state.month} />
            <TopThree 
              month={this.state.month} 
              expenses={this.state.expenses}
            />
          </div>

          <div className="PieChart">
            <MonthPieChart 
              labels={this.state.categories} 
              categoricalData={this.state.categoricalData} 
              expenses={this.state.expenses} 
            />
          </div>

          <div className="AddBarAndExpenseTable">
            <AddBar
              onClick={this._handleClick} 
              month={this.state.month}
              handleSubmit={this._addExpense}
            />
            <ExpenseTable 
              month={this.state.month} 
              expenses={this.state.expenses}
            />
          </div>

        </div>

        <div className="Pagination">
          <PageButtons />
        </div>

      </div>
    );
  }

  _addExpense = (expense) => {
    this.setState({
      expenses: [
        ...this.state.expenses,
        expense
      ]
    });
  }

}

export default App;
