
import React, { useState } from 'react';
import { Heart, MessageCircle, Share } from 'lucide-react';

interface PostData {
  id: string;
  username: string;
  avatar: string;
  image: string;
  caption: string;
  likes: number;
  comments: number;
  timeAgo: string;
}

interface PostProps {
  post: PostData;
}

const Post: React.FC<PostProps> = ({ post }) => {
  const [isLiked, setIsLiked] = useState(false);
  const [likesCount, setLikesCount] = useState(post.likes);

  const handleLike = () => {
    setIsLiked(!isLiked);
    setLikesCount(prev => isLiked ? prev - 1 : prev + 1);
  };

  return (
    <div className="bg-white border border-gray-200 rounded-lg mb-6 max-w-2xl mx-auto">
      {/* Post Header */}
      <div className="flex items-center p-4">
        <img
          src={post.avatar}
          alt={post.username}
          className="w-8 h-8 rounded-full object-cover"
        />
        <div className="ml-3 flex-1">
          <h3 className="font-semibold text-sm">{post.username}</h3>
        </div>
        <button className="text-gray-400 hover:text-gray-600">
          <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
          </svg>
        </button>
      </div>

      {/* Post Image */}
      <div className="aspect-square">
        <img
          src={post.image}
          alt="Post content"
          className="w-full h-full object-cover"
        />
      </div>

      {/* Post Actions */}
      <div className="p-4">
        <div className="flex items-center space-x-4 mb-3">
          <button 
            onClick={handleLike}
            className={`transition-colors ${isLiked ? 'text-red-500' : 'text-gray-700 hover:text-gray-500'}`}
          >
            <Heart className={`h-6 w-6 ${isLiked ? 'fill-current' : ''}`} />
          </button>
          <button className="text-gray-700 hover:text-gray-500">
            <MessageCircle className="h-6 w-6" />
          </button>
          <button className="text-gray-700 hover:text-gray-500">
            <Share className="h-6 w-6" />
          </button>
        </div>

        {/* Likes Count */}
        <div className="mb-2">
          <span className="font-semibold text-sm">{likesCount.toLocaleString()} likes</span>
        </div>

        {/* Caption */}
        <div className="mb-2">
          <span className="font-semibold text-sm mr-2">{post.username}</span>
          <span className="text-sm">{post.caption}</span>
        </div>

        {/* Comments Preview */}
        {post.comments > 0 && (
          <button className="text-gray-500 text-sm mb-2 hover:text-gray-700">
            View all {post.comments} comments
          </button>
        )}

        {/* Time */}
        <div className="text-gray-400 text-xs uppercase">
          {post.timeAgo}
        </div>
      </div>
    </div>
  );
};

export default Post;
