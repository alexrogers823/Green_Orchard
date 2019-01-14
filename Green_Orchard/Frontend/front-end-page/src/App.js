import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import config from './config';
const NEWSAPIKEY = config.NEWSAPIKEY;
console.log(NEWSAPIKEY);



class App extends Component {
    state = { 
    expenses: [
        {"Expense":"mail","Cost":5.75,"Category":"Transport","Notes":"idk","Date":"Dec 12"},
        {"Expense":"chipotle","Cost":6.97,"Category":"Res","Notes":"burrito bowl","Date":"Dec 12"},
        {"Expense":"rent","Cost":800,"Category":"Rent","Notes":"clairmont reserve,","Date":"Dec 12"}
],  

news: [
    {}
]

    }


    componentDidMount(){
        this.updateList();
        setInterval(this.updateList,1000);
    }
    updateList =() =>{
        fetch(`https://newsapi.org/v2/top-headlines?sources=cnbc&apiKey=${NEWSAPIKEY}`)
        .then(r => r.json())
        .then(cnbc =>{
            this.setState({
                news: cnbc.articles
            });
            
        })
    }

    render() { 
const ListOfExpenses = this.state.expenses.map(expense =>{
    return(
        <div>
        <ul>
        <li>Date: {expense.Date}</li>
        <li>Expense:{expense.Expense}</li>
        <li>Cost: {expense.Cost}</li>
        </ul>
        </div>
    )
})

const CnbcNews = this.state.news.map(cnbcnews =>{
    return(
        <div>
        <ul>
            <li>
            <p>{cnbcnews.publishedAt}</p>
            <a target="_blank" href={cnbcnews.url}>{cnbcnews.title}</a>
            </li>
            
        </ul>
        </div>
    )
})


        return (
        <div>
        <div class="WelcomeBack">
        <h2>Welcome Back {}</h2>
        <h2>Take a Look at your Orchard</h2>
    </div>

    

    <div class="Top5">

        <div class="all">
            <h3>All Expenses</h3>
            <ul>
                <li>{ListOfExpenses}</li>
                
        
            </ul>
        </div>

        <div class="grouped">
            <h3>Grouped Expenses</h3>
            <h1>Bar Chart</h1>
        </div>
            
        <div class="News">
            <h3>News</h3>
            <div class="CNBC">
            <ul>
                <p>{CnbcNews}</p>
            </ul>
            </div>
        </div>

    </div> 
    </div>
    );

    }
}

export default App ;


