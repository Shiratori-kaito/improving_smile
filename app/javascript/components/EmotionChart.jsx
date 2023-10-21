import React from 'react';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

export const options = {
  responsive: true,
  maintainAspectRatio: false, // アスペクト比を維持しない
  indexAxis: 'y',
  scales: {
    y: {
      beginAtZero: true,
      ticks: {
        autoSkip: false, // ラベルを自動的にスキップしない
        maxRotation: 0,  // ラベルの回転を許可しない
        minRotation: 0
      }
    }
  },
  plugins: {
    legend: {
      position: 'top',
    },
    title: {
      display: true,
      text: '感情パラメーターチャート',
    },
  },
};


export const EmotionChart = ({ emotions = {} }) => {
  const labels = Object.keys(emotions);
  const dataValues = Object.values(emotions).map(value => parseInt(value));

  const chartData = {
    labels: labels,
    datasets: [
      {
        label: '感情パラメーター',
        data: dataValues,
        backgroundColor: [
          'blue', 'green', 'red', 'yellow', 'aqua', 'purple', 'orange', 'lime'
        ],
        borderColor: [
          'blue', 'green', 'red', 'yellow', 'aqua', 'purple', 'orange', 'lime'
        ],
        borderWidth: 1,
      },
    ],
  };

  return (
    <div style={{ width: '100%', height: '400px' }}>
      <Bar data={chartData} options={options} />
    </div>
  )
}