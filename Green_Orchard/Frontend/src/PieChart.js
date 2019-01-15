import React, { Component } from 'react';
import { PieChart } from 'react-d3-components';

class MonthPieChart extends Component {
  constructor(props) {
    super(props);
    this.Chart = PieChart;
    this.data = {
      label: 'somethingA',
      values: [

      ]
    }

    this.sort = null;

  }

  // _resetAddBar = () => {
  //   this.setState({
  //     Expense: '',
  //     Category: '',
  //     Cost: '',
  //     Month: this.props.month,
  //   });
  // }

  _populatePieChart() {
    const sections = this.props.labels;
    const labels = sections.map(label => {
      if (label === "Payment/Credit") {
        return {x: '0', y: 0};
      }
      return {x: label, y: this._sumFromLabel(label)};
    });

    this.data.values = labels;

    console.log(this.props.expenses);

  }

  _pieChartLevel2 = (arc) => {
    const sections = this.props.pieData;
    const labels = sections.map(label => {
      return {x: label, y: this._sumFromLabel};
    });

    console.log(labels);

    
  }

  _matchExpenseToCategory(expense, label) {
    // const qualifiedResults = this.props.categoricalData.filter(instance => instance.Category === label)
    if (expense[4] === label) {
      return (expense);
    } else {
      return (undefined);
    }
  }

  _sumFromLabel(label) {
    const arrayOfExpenses = this.props.expenses;
    const labelExpenses = [];
    arrayOfExpenses.forEach(expense => {
      labelExpenses.push(this._matchExpenseToCategory(expense, label));
    });

    const filteredExpenses = labelExpenses.filter(instance => instance !== undefined);

    const finalNumber = filteredExpenses.reduce((a, expense) => (a + parseFloat(expense[5])), 0);
  
    console.log(finalNumber);
    return finalNumber;

  }

  render() {
    this._populatePieChart();

    return (
      <this.Chart
        data={this.data}
        width={600}
        height={400}
        margin={{top: 10, bottom: 10, left: 100, right: 100}}
        sort={this.sort}
      />
    )
  }
}

export default MonthPieChart;
