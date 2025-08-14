import logo from './logo.svg';
import './App.css';
import EmployeeShow from './components/employeeShow/employeeShow';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import DashBoard from './components/dashBoard/dashBoard';
import ApplyLeave from './components/applyLeave/applyLeave';
import LeaveHistory from './components/leaveHistory/leaveHistory';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<EmployeeShow />} /> 
          <Route path="/dashBoard" element={<DashBoard />} />
          <Route path="/applyLeave" element={<ApplyLeave />} />
          <Route Path="/leaveHistory" element={<LeaveHistory/>}/>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;