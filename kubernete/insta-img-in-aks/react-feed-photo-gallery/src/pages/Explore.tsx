
import React from 'react';

const Explore = () => {
  const exploreImages = [
    'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1517022812141-23620dba5c23?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=400&h=500&fit=crop',
    'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&h=600&fit=crop',
  ];

  return (
    <div className="bg-gray-50 min-h-screen pt-16">
      <div className="max-w-6xl mx-auto px-4 py-8">
        <div className="bg-white rounded-lg p-6">
          <h1 className="text-2xl font-light mb-6">Explore</h1>
          
          <div className="grid grid-cols-3 gap-1 md:gap-4">
            {exploreImages.map((image, index) => (
              <div 
                key={index} 
                className={`relative overflow-hidden rounded-lg cursor-pointer group ${
                  index % 7 === 0 ? 'row-span-2' : 'aspect-square'
                }`}
              >
                <img
                  src={image}
                  alt={`Explore ${index + 1}`}
                  className="w-full h-full object-cover transition-transform group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-all duration-200"></div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Explore;
