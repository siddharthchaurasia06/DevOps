
import React from 'react';
import Stories from './Stories';
import Post from './Post';

const Feed = () => {
  const posts = [
    {
      id: '1',
      username: 'sarah_dev',
      avatar: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=100&h=100&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=600&h=600&fit=crop',
      caption: 'Working from my cozy corner today ✨ Sometimes the best office is wherever you feel inspired! #workfromhome #productivity',
      likes: 1247,
      comments: 32,
      timeAgo: '2 hours ago'
    },
    {
      id: '2',
      username: 'techguru',
      avatar: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=100&h=100&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=600&h=600&fit=crop',
      caption: 'Deep in code mode 🚀 Building something amazing today. When you love what you do, it never feels like work! #coding #developer',
      likes: 892,
      comments: 28,
      timeAgo: '4 hours ago'
    },
    {
      id: '3',
      username: 'nature_lover',
      avatar: 'https://images.unsplash.com/photo-1517022812141-23620dba5c23?w=100&h=100&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1517022812141-23620dba5c23?w=600&h=600&fit=crop',
      caption: 'Morning run with these beautiful companions 🐑 Nothing beats the peace of countryside mornings. Nature therapy at its finest!',
      likes: 2156,
      comments: 67,
      timeAgo: '6 hours ago'
    },
    {
      id: '4',
      username: 'cat_photos',
      avatar: 'https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=100&h=100&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=600&h=600&fit=crop',
      caption: 'Lazy Sunday vibes with my favorite furry friend 🐱 Sometimes you just need to embrace the art of doing absolutely nothing!',
      likes: 3241,
      comments: 89,
      timeAgo: '8 hours ago'
    }
  ];

  return (
    <div className="bg-gray-50 min-h-screen pt-16">
      <Stories />
      <div className="py-8 px-4">
        {posts.map(post => (
          <Post key={post.id} post={post} />
        ))}
      </div>
    </div>
  );
};

export default Feed;
