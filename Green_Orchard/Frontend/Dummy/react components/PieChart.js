import React, { Component } from 'react';
import { PieChart } from 'react-d3-components';

class MonthPieChart extends Component {
    constructor(props) {
        super(props);
        this.Chart = PieChart;
        this.data = {
            label : 'somethingA',
            values : [

            ]
        }
        this.sort = null;
    }

    _populatePieChart() {
        const sections = this.props.labels;
        const labels = sections.map(label => {
            return {x: label, y: this._sumFromLabel(label)};
        });

        this.data.values = labels;

        console.log(this.props.expenses);
    }

    _matchExpenseToCategory(expense, label) {
        const qualifiedResults = this.props.categoricalData.filter(instance => instance.Category === label);
        const matchedExpense = qualifiedResults.find(instance => {
            return instance.Category === expense.Category || 
            instance.Keyword === expense.Category.toLowerCase();
        });
        if (matchedExpense) {
            return expense;
        };
    }

    _sumFromLabel(label) {
        const arrayOfExpenses = this.props.expenses;
        const labelExpenses = [];
        arrayOfExpenses.forEach(expense => {
            labelExpenses.push(this._matchExpenseToCategory(expense, label));
        })

        const filteredExpenses = labelExpenses.filter(instance => instance !== undefined);

        const finalNumber = filteredExpenses.reduce((a, expense) => (a + expense.Cost), 0);

        return finalNumber;
    }

    render() {
        return (
            <this.Chart 
                data = {this.data}
                width = {600}
                height = {400}
                margin = {{top: 10, bottom: 10, left: 100, right: 100}}
                sort = {this.sort}
            />
        );
    }
}

export default MonthPieChart;