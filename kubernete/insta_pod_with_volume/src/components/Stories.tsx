
import React from 'react';

interface Story {
  id: string;
  username: string;
  avatar: string;
  hasNewStory: boolean;
}

const Stories = () => {
  const stories: Story[] = [
    { id: '1', username: 'your_story', avatar: 'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=100&h=100&fit=crop&crop=face', hasNewStory: false },
    { id: '2', username: 'sarah_dev', avatar: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=100&h=100&fit=crop&crop=face', hasNewStory: true },
    { id: '3', username: 'techguru', avatar: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=100&h=100&fit=crop&crop=face', hasNewStory: true },
    { id: '4', username: 'designer_pro', avatar: 'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=100&h=100&fit=crop&crop=face', hasNewStory: true },
    { id: '5', username: 'nature_lover', avatar: 'https://images.unsplash.com/photo-1517022812141-23620dba5c23?w=100&h=100&fit=crop&crop=face', hasNewStory: false },
    { id: '6', username: 'cat_photos', avatar: 'https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=100&h=100&fit=crop&crop=face', hasNewStory: true },
  ];

  return (
    <div className="bg-white border-b border-gray-200 p-4">
      <div className="max-w-2xl mx-auto">
        <div className="flex space-x-4 overflow-x-auto scrollbar-hide">
          {stories.map((story) => (
            <div key={story.id} className="flex flex-col items-center space-y-2 min-w-0 cursor-pointer">
              <div className={`p-1 rounded-full ${story.hasNewStory ? 'bg-gradient-to-tr from-yellow-400 to-pink-600' : 'bg-gray-300'}`}>
                <div className="bg-white p-1 rounded-full">
                  <img
                    src={story.avatar}
                    alt={story.username}
                    className="w-14 h-14 rounded-full object-cover"
                  />
                </div>
              </div>
              <span className="text-xs text-gray-700 truncate w-16 text-center">
                {story.username}
              </span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Stories;
