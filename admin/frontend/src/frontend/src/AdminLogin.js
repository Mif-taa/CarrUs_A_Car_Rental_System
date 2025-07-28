// import React, { useState } from 'react';
// import './AdminLogin.css';

// const AdminLogin = () => {
//   const [formData, setFormData] = useState({ username: '', password: '' });
//   const [error, setError] = useState('');

//   const handleChange = e => {
//     setFormData({...formData, [e.target.name]: e.target.value });
//   };

//   const handleSubmit = async e => {
//     e.preventDefault();
// const response = await fetch('http://localhost:3000/admin/backend/login.php', {
//   method: 'POST',
//   headers: { 'Content-Type': 'application/json' },
//   credentials: 'include',  // << important for cookies/session
//   body: JSON.stringify(formData),
// });


//     const result = await response.json();
//     if (result.success) {
//       alert("Login successful");
//       window.location.href = '/admin-dashboard'; // Change to your route
//     } else {
//       setError(result.message);
//     }
//   };

//   return (
//     <div className="login-box">
//       <h2>Admin Login</h2>
//       <form onSubmit={handleSubmit}>
//         <input type="text" name="username" placeholder="Username" onChange={handleChange} required />
//         <input type="password" name="password" placeholder="Password" onChange={handleChange} required />
//         <button type="submit">Login</button>
//         {error && <p className="error">{error}</p>}
//       </form>
//     </div>
//   );
// };

// export default AdminLogin;
