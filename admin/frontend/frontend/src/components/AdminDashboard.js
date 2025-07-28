import React, { useEffect, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './AdminDashboard.css';
import {
  Chart as ChartJS,
  ArcElement,
  BarElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend,
} from 'chart.js';
import { Pie, Bar } from 'react-chartjs-2';
ChartJS.register(ArcElement, BarElement, CategoryScale, LinearScale, Tooltip, Legend);
const AdminDashboard = () => {
  const [stats, setStats] = useState(null);
  const [admin, setAdmin] = useState(null);
  useEffect(() => {
    fetch('http://localhost/carrus(front end)final/admin/backend/stats.php', { credentials: 'include' })
      .then(res => res.json())
      .then(data => {
        setStats(data.statistics);
        setAdmin(data.admin);
      });
  }, []);
  const handleLogout = () => {
    fetch('http://localhost/carrus(front end)final/admin/backend/logout.php', {
      method: 'POST',
      credentials: 'include'
    }).then(() => {
      window.location.href = '/';
    });
  };
  if (!stats || !admin) {
    return <div className="text-center mt-5">Loading...</div>;
  }
  const pieData = {
    labels: stats.chartLabels,
    datasets: [{
      data: stats.chartData,
      backgroundColor: ['#004687', '#B0C4DE', '#4682B4', '#2E5090']
    }]
  };
  const barData = {
    labels: stats.chartLabels,
    datasets: [{
      label: 'Cars',
      data: stats.chartData,
      backgroundColor: ['#004687', '#B0C4DE', '#4682B4', '#2E5090']
    }]
  };
  return (
    <div className="min-vh-100">
      <nav className="navbar navbar-expand-lg navbar-dark px-4">
        <div className="container-fluid">
          <a className="navbar-brand d-flex align-items-center" href="/">
            <img src="/logo.png" alt="Logo" width="40" className="me-2" />
            CarrUs Admin
          </a>
          <div className="ms-auto text-white">
            Hi, {admin.username}
            <button className="btn btn-outline-light ms-3" onClick={handleLogout}>
              Logout
            </button>
          </div>
        </div>
      </nav>
      <div className="container">
        {/* Statistic Cards */}
        <div className="row g-4 mb-4">
          <StatCard label="Total Users" value={stats.total_users} />
          <StatCard label="Total Bookings" value={stats.total_bookings} />
          <StatCard label="Cars Available" value={stats.cars_available} />
          <StatCard label="Active Admins" value={stats.active_admins} />
        </div>
        {/* Charts */}
        <div className="row g-4 justify-content-center">
          <div className="col-md-6 d-flex justify-content-center">
            <div className="card2 p-4">
              <h5 className="text-center">Car Category Distribution</h5>
              <Pie data={pieData} />
            </div>
          </div>
          <div className="col-md-6 d-flex justify-content-center">
            <div className="card2 p-4">
              <h5 className="text-center">Car Category Bar Chart</h5>
              <Bar data={barData} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
const StatCard = ({ label, value }) => (
  <div className="col-md-3">
    <div className="card shadow text-center p-3">
      <h6 className="text-muted">{label}</h6>
      <h3 className="text-primary">{value}</h3>
    </div>
  </div>
);
export default AdminDashboard;
