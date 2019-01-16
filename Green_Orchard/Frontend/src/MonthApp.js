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
      "01": "January",
      "02": "February",
      "03": "March",
      "04": "April",
      "05": "May",
      "06": "June",
      "07": "July",
      "08": "August",
      "09": "September",
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

  _getCategoryNames(number) {
    const categoryName = {
      "1": "Rent",
      "2": "Utilities",
      "3": "Automotive",
      "4": "Fast Food",
      "5": "Groceries",
      "6": "Education",
      "7": "Medical/Health",
      "8": "Travel",
      "9": "Student Loans"
    }

    return categoryName[`${number}`];
  }

  async componentDidMount() {
    const data = await fetch('/expenses/month/')
      .then(r => r.json())
      .then(({expenses}) => {
        this.setState({
          expenses,
        })
      })

    let monthNumber = "01";
    // const categoricalData = await fetch('https://raw.githubusercontent.com/alexrogers823/interactiveBarGraph/master/CategoryWords.json').then(r => r.json());
    // const monthData = data;
    // console.log(monthData);
    const monthName = this.monthNames[monthNumber];
    const categoryName;

    // console.log(data);

    this.setState({
      month: monthName,
      expenses: expenses.map(exp => {
        return ({
          "month": exp.month,
          "name": exp.name,
          "amount": exp.amount,
          "category": exp.category
        })
      ).filter(exp => exp.month === monthNumber),
      // pieData:
      categories: [...new Set([...data].map(exp => _getCategoryNames(exp.category)))], // Fix this in a second
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
