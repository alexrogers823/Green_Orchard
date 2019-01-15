import React, { Component } from 'react';
import './App.css';
import CurrentMonth from './CurrentMonth';
import TopThree from './Top3Expenses';
import MonthPieChart from './PieChart';
import AddBar from './AddBar';
import ExpenseTable from './ExpenseTable';
import PageButtons from './Pagination';

class MonthApp extends Component {
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
        // for level 2
        pieData: [],
        // -----------
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
    // fetch('/expenses/month/')
    //   .then(r => r.json())
    //   .then(({expenses}) => {
    //     this.setState({
    //       expenses,
    //     })
    //   })
    const data = await fetch('https://raw.githubusercontent.com/alexrogers823/Green_Orchard/staging/Green_Orchard/Frontend/sample_data.json').then(r => r.json());
    // const categoricalData = await fetch('https://raw.githubusercontent.com/alexrogers823/interactiveBarGraph/master/CategoryWords.json').then(r => r.json());
    // const monthData = data;
    // console.log(monthData);
    // const monthName = this.monthNames[monthData.Month];

    // console.log(data);

    const finalData = [];
    for (let i=1; i<42; i++) {
      finalData.push(data[`${i}`].Expense)
    };

    this.setState({
      month: '10',
      expenses: finalData,
      // pieData:
      categories: [...new Set(finalData.map(category => category[4]))],
      // categoricalData: categoricalData.Keywords,
    })
  }

  render() {
    // console.log(this.state.expenses);
    return (
      <div className="container">

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
              // categoricalData={this.state.categoricalData}
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
          <PageButtons
            handleIncrease={this._increaseMonth}
            handleDecrease={this._decreaseMonth}
          />
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

  _increaseMonth = () => {
    // console.log("increasing month");
    // console.log(this.state.month);
    let thisMonth = parseInt(this.state.month);
    let nextMonth;
    if (thisMonth < 12) {
      nextMonth = thisMonth + 1;
    } else if (parseInt(this.state.month) === 12) {
      nextMonth = 1;
    }

    this.setState({
      month: nextMonth
    });
  }

  _decreaseMonth = () => {
    // console.log("decreasing month");
    // console.log(this.state.month);
    let thisMonth = parseInt(this.state.month);
    let previousMonth;
    if (this.state.month > 1) {
      previousMonth = thisMonth - 1;
    } else if (parseInt(this.state.month) === 1) {
      previousMonth = 12;
    }

    this.setState({
      month: previousMonth
    });
  }

}

export default MonthApp;
