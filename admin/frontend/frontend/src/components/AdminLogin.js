import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './AdminLogin.css';

const AdminLogin = () => {
  const [formData, setFormData] = useState({ username: '', password: '' });
  const [error, setError] = useState('');

  const handleChange = e => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async e => {
    e.preventDefault();

    const response = await fetch('http://localhost/carrus(front end)final/admin/backend/login.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(formData),
    });

    const result = await response.json();
    if (result.success) {
      window.location.href = '/admin-dashboard';
    } else {
      setError(result.message);
    }
  };

  return (
    <div className="d-flex flex-column justify-content-center align-items-center vh-100 login-background">
      <img src="/logo.png" alt="Logo" className="animate-logo mb-3" width={90} />
      
      <div className="login-box card p-4 shadow-lg border-0">
        <h3 className="text-center mb-3">Admin Login</h3>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="text"
              name="username"
              placeholder="Username"
              className="form-control"
              onChange={handleChange}
              required
            />
          </div>
          <div className="mb-3">
            <input
              type="password"
              name="password"
              placeholder="Password"
              className="form-control"
              onChange={handleChange}
              required
            />
          </div>
          <button type="submit" className="btn btn-primary w-100">Login</button>
          {error && <div className="alert alert-danger mt-3 text-center">{error}</div>}
        </form>
      </div>

      <footer className="text-muted mt-4 small text-center">&copy; 2025 CarrUs Admin Panel</footer>
    </div>
  );
};

export default AdminLogin;
