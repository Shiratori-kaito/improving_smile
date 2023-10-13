import React from 'react';
import { createRoot } from 'react-dom/client';


export const UserPosts = ({posts}) => {
  return (
    <div>
      {posts.map((post) => (
        <div key={post.id}>
          <p>{post.content}</p>
        </div>
      ))}
    </div>
  );
};
