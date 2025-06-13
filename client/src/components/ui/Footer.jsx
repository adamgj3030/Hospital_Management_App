import React from "react";
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <footer className="bg-white flex flex-col gap-2 sm:flex-row py-6 w-full shrink-0 items-center px-4 md:px-6 border-t">
      <p className="text-xs text-gray-500 dark:text-gray-400">
        © 2024 WomenWell. All rights reserved.
      </p>
      <nav className="sm:ml-auto flex gap-4 sm:gap-6">
        <Link
          className="text-xs hover:underline underline-offset-4 decoration-pink-500"
          to="#"
        >
          Terms of Service
        </Link>
        <Link
          className="text-xs hover:underline underline-offset-4 decoration-pink-500"
          to="#"
        >
          Privacy
        </Link>
        <Link
          className="text-xs hover:underline underline-offset-4 decoration-pink-500"
          to="#"
        >
          Contact Support
        </Link>
      </nav>
    </footer>
  );
};

export default Footer;
