import React, { Component } from 'react';
import MonthPieChart from './PieChart.js';
import Summary from './Summary';
import Category from './Category';

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
        };

        this.state = {
            month: '',
            expenses: [],
            categories: [],
            categoricalData: []
        }

        this._handleClick = this._handleClick.bind(this);
    }
    
    _handleClick(e) {
        e.preventDefault();
        console.dir(e);
    }
}