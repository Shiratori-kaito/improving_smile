import React from 'react';
import { createRoot } from 'react-dom/client';


export const LikedPosts = ({likedPosts}) => {
  return (
    <div>
        <div key={likedPosts.id}>
          <p>{likedPosts.title}</p>
        </div>
    </div>
  );
};
