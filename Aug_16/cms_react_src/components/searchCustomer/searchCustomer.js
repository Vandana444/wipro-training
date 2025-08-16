import React, { useState } from "react";
import axios from "axios";

function SearchCustomer() {
  const [custId, setCustId] = useState("");
  const [customer, setCustomer] = useState(null);
  const [error, setError] = useState("");

  const handleSearch = async () => {
    try {
      const res = await axios.get(`https://localhost:7226/api/Customers/${custId}`);
      setCustomer(res.data);
      setError("");
    } catch (e) {
      setCustomer(null);
      setError("Customer not found or error occurred.");
    }
  };

  return (
    <div>
      <h3>Search Customer by ID</h3>
      <label>Customer ID: </label>
      <input
        type="number"
        value={custId}
        onChange={(e) => setCustId(e.target.value)}
        onKeyDown={(e) => e.key === "Enter" && handleSearch()}
      />
      <button onClick={handleSearch}>Search</button>

      {error && <p style={{ color: "red" }}>{error}</p>}

      {customer && (
        <div style={{ textAlign: "center", maxWidth: 420, margin: "12px auto" }}>
          custId : <b>{customer.custId}</b> <br />
          custName : <b>{customer.custName}</b> <br />
          custUserName : <b>{customer.custUserName}</b> <br />
          custPassword : <b>{customer.custPassword}</b> <br />
          city : <b>{customer.City ?? customer.city}</b> <br />
          state : <b>{customer.State ?? customer.state}</b> <br />
          email : <b>{customer.email}</b> <br />
          mobileNo : <b>{customer.mobileNo}</b> <br />
        </div>
      )}
    </div>
  );
}

export default SearchCustomer;
