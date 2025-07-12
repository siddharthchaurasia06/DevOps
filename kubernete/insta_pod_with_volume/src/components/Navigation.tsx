
import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Home, MessageCircle, User, Heart, Search } from 'lucide-react';

const Navigation = () => {
  const location = useLocation();
  
  const isActive = (path: string) => location.pathname === path;
  
  return (
    <nav className="fixed top-0 left-0 right-0 bg-white border-b border-gray-200 z-50">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <Link to="/" className="text-2xl font-bold bg-gradient-to-r from-purple-600 to-pink-600 bg-clip-text text-transparent">
            Instagram
          </Link>
          
          {/* Search Bar */}
          <div className="hidden md:flex items-center bg-gray-100 rounded-lg px-3 py-2 w-64">
            <Search className="h-4 w-4 text-gray-400 mr-2" />
            <input
              type="text"
              placeholder="Search"
              className="bg-transparent outline-none text-sm w-full"
            />
          </div>
          
          {/* Navigation Icons */}
          <div className="flex items-center space-x-6">
            <Link 
              to="/" 
              className={`p-2 rounded-lg transition-colors ${
                isActive('/') ? 'text-black' : 'text-gray-600 hover:text-black'
              }`}
            >
              <Home className="h-6 w-6" />
            </Link>
            <Link 
              to="/messages" 
              className={`p-2 rounded-lg transition-colors ${
                isActive('/messages') ? 'text-black' : 'text-gray-600 hover:text-black'
              }`}
            >
              <MessageCircle className="h-6 w-6" />
            </Link>
            <div className="p-2 rounded-lg text-gray-600 hover:text-black transition-colors cursor-pointer">
              <Heart className="h-6 w-6" />
            </div>
            <Link 
              to="/profile" 
              className={`p-2 rounded-lg transition-colors ${
                isActive('/profile') ? 'text-black' : 'text-gray-600 hover:text-black'
              }`}
            >
              <User className="h-6 w-6" />
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navigation;
