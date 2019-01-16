import React, { Component } from 'react';
import { BarChart } from 'react-d3-components';

const CreateBarChart = () => {
  const SummaryBarChart = BarChart;
  const data = [{
    label: 'somethingA',
    values: [
      {x: 'Rent', y: 10},
      {x: 'Utilities', y: 4},
      {x: 'Groceries', y: 3},
      {x: 'Supplies', y: 6},
      {x: 'Apparel', y: 8},
      {x: 'Education', y: 4},
      {x: 'Other', y: 3}
    ]
  }];

  return (
    <SummaryBarChart
    data={data}
    width={400}
    height={400}
    margin={{top: 10, bottom: 50, left: 50, right: 10}}/>,
    document.getElementById('location')
  );
}

export default CreateBarChart;
