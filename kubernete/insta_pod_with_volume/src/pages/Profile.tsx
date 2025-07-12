
import React from 'react';

const Profile = () => {
  const userPosts = [
    'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=300&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=300&h=300&fit=crop',
    'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=300&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=300&h=300&fit=crop',
    'https://images.unsplash.com/photo-1517022812141-23620dba5c23?w=300&h=300&fit=crop',
    'https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=300&h=300&fit=crop',
  ];

  return (
    <div className="bg-gray-50 min-h-screen pt-16">
      <div className="max-w-4xl mx-auto px-4 py-8">
        {/* Profile Header */}
        <div className="bg-white rounded-lg p-8 mb-8">
          <div className="flex flex-col md:flex-row items-center md:items-start space-y-6 md:space-y-0 md:space-x-8">
            <img
              src="https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=150&h=150&fit=crop&crop=face"
              alt="Profile"
              className="w-32 h-32 rounded-full object-cover"
            />
            <div className="flex-1 text-center md:text-left">
              <div className="flex flex-col md:flex-row md:items-center md:space-x-8 space-y-4 md:space-y-0">
                <h1 className="text-2xl font-light">your_username</h1>
                <button className="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600 transition-colors">
                  Edit Profile
                </button>
              </div>
              <div className="flex justify-center md:justify-start space-x-8 mt-6">
                <div className="text-center">
                  <span className="font-semibold text-lg block">42</span>
                  <span className="text-gray-600 text-sm">posts</span>
                </div>
                <div className="text-center">
                  <span className="font-semibold text-lg block">1,234</span>
                  <span className="text-gray-600 text-sm">followers</span>
                </div>
                <div className="text-center">
                  <span className="font-semibold text-lg block">567</span>
                  <span className="text-gray-600 text-sm">following</span>
                </div>
              </div>
              <div className="mt-6">
                <h2 className="font-semibold">Your Name</h2>
                <p className="text-gray-600 mt-1">
                  ✨ Creating digital experiences<br/>
                  📍 San Francisco, CA<br/>
                  💻 Full-stack developer
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Posts Grid */}
        <div className="bg-white rounded-lg p-6">
          <div className="border-b border-gray-200 mb-6">
            <nav className="flex space-x-8">
              <button className="py-3 px-1 border-b-2 border-black font-medium text-sm">
                POSTS
              </button>
              <button className="py-3 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700 font-medium text-sm">
                SAVED
              </button>
              <button className="py-3 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700 font-medium text-sm">
                TAGGED
              </button>
            </nav>
          </div>
          
          <div className="grid grid-cols-3 gap-1 md:gap-6">
            {userPosts.map((post, index) => (
              <div key={index} className="aspect-square">
                <img
                  src={post}
                  alt={`Post ${index + 1}`}
                  className="w-full h-full object-cover rounded-lg hover:opacity-90 transition-opacity cursor-pointer"
                />
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Profile;
