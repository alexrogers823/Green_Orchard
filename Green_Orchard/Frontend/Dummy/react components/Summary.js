import React from 'react'

class Summary extends Component {
    state = { 
    expenses: [
        {"Expense":"mail","Cost":5.75,"Category":"Transport","Notes":"idk"},
        {"Expense":"chipotle","Cost":6.97,"Category":"Res","Notes":"burrito bowl"},
        {"Expense":"rent","Cost":800,"Category":"Rent","Notes":"clairmont reserve"}
]  

    }

    render() { 
const ListOfExpenses = this.state.expenses.map(expense =>{
    return(
        <div>
        <li>{expense.Cost}</li>
        <li>{expense.Notes}</li>
        <li>{expense.Category}</li>
        </div>
    )
})

        return (
        <div>
        <div class="WelcomeBack">
        <h2>Welcome Back {Name}</h2>
    </div>

    <h2>Take a Look at your Orchard</h2>

    <div class="Categories">

        <div class="all">
            <h3>All Expenses</h3>
            <ul>
                
                <li>{ListOfExpenses}</li>
                <li>{ListOfExpenses}</li>
                <li>{ListOfExpenses}</li>
                <li>{ListOfExpenses}</li>
            </ul>
        </div>

        <div class="grouped">
            <h3>Grouped Expenses</h3>
            <h1>Bar Chart</h1>
        </div>

        <div class="News">
            <h3>News</h3>
            <ul>
                <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ullam quia sunt porro possimus repellat natus, architecto ducimus. Natus provident a similique ab neque </li>
                <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ullam quia sunt porro possimus repellat natus, architecto ducimus. Natus provident a similique ab neque</li>
                <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ullam quia sunt porro possimus repellat natus, architecto ducimus. Natus provident a similique ab neque</li>
                <li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ullam quia sunt porro possimus repellat natus, architecto ducimus. Natus provident a similique ab neque</li>
            </ul>
        </div>

    </div> 
    </div>
    );

    }
}

export default Summary ;

