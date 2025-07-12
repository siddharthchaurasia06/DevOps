
import React from 'react';
import { MessageCircle } from 'lucide-react';

const Messages = () => {
  const conversations = [
    {
      id: 1,
      username: 'sarah_dev',
      avatar: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=100&h=100&fit=crop&crop=face',
      lastMessage: 'Hey! How\'s the project going?',
      time: '2m',
      unread: true
    },
    {
      id: 2,
      username: 'techguru',
      avatar: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=100&h=100&fit=crop&crop=face',
      lastMessage: 'Thanks for the code review!',
      time: '1h',
      unread: false
    },
    {
      id: 3,
      username: 'designer_pro',
      avatar: 'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=100&h=100&fit=crop&crop=face',
      lastMessage: 'Love the new design! 🎨',
      time: '3h',
      unread: true
    }
  ];

  return (
    <div className="bg-gray-50 min-h-screen pt-16">
      <div className="max-w-4xl mx-auto px-4 py-8">
        <div className="bg-white rounded-lg shadow-sm">
          <div className="p-6 border-b border-gray-200">
            <h1 className="text-2xl font-light">Messages</h1>
          </div>
          
          <div className="divide-y divide-gray-200">
            {conversations.map((conversation) => (
              <div key={conversation.id} className="p-4 hover:bg-gray-50 cursor-pointer transition-colors">
                <div className="flex items-center space-x-3">
                  <img
                    src={conversation.avatar}
                    alt={conversation.username}
                    className="w-12 h-12 rounded-full object-cover"
                  />
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center justify-between">
                      <h3 className="font-semibold text-sm truncate">{conversation.username}</h3>
                      <span className="text-xs text-gray-500">{conversation.time}</span>
                    </div>
                    <p className={`text-sm truncate ${conversation.unread ? 'font-medium text-black' : 'text-gray-600'}`}>
                      {conversation.lastMessage}
                    </p>
                  </div>
                  {conversation.unread && (
                    <div className="w-2 h-2 bg-blue-500 rounded-full"></div>
                  )}
                </div>
              </div>
            ))}
          </div>
          
          {conversations.length === 0 && (
            <div className="p-12 text-center">
              <MessageCircle className="mx-auto h-12 w-12 text-gray-400 mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">No messages yet</h3>
              <p className="text-gray-500">Start a conversation with your friends!</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Messages;
