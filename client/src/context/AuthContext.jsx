import React, { createContext, useState, useEffect } from "react";
import { default as jwt_decode } from "jwt-decode"; // Fixed import
import { useNavigate } from "react-router-dom";

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [userRole, setUserRole] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      setIsLoggedIn(true);
      const decoded = jwt_decode(token);
      setUserRole(decoded.role); // Extract and set user role
    }
    setIsLoading(false);
  }, []);

  const login = (token) => {
    localStorage.setItem("token", token);
    setIsLoggedIn(true);
    const decoded = jwt_decode(token);
    setUserRole(decoded.role); // Extract and set user role on login
    navigate("/");
  };

  const logout = () => {
    localStorage.removeItem("token");
    setIsLoggedIn(false);
    setUserRole(null); // Clear role on logout
    navigate("/");
  };

  return (
    <AuthContext.Provider
      value={{ isLoggedIn, login, logout, userRole, isLoading }}
    >
      {children}
    </AuthContext.Provider>
  );
};
