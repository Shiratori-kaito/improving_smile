
import React, { useState, useEffect, useInsertionEffect } from 'react';

export const UserPosts = ({posts}) => {
  const flatPosts = posts.flat();
  console.log(flatPosts);
  const user = flatPosts[0].user;

  return (
    <div>
      {posts.map((post) => (
        <div key={post.id}>
          <div className="bg-white rounded-lg shadow p-4 mb-4">
            <a href={`/posts/${post.id}`} className='ml-auto text-gray-500' do >
              <div className="ml-4">
                <p className="text-gray-500">{post.created_at}</p>
              </div>
              <div className="bg-gray-100 p-2 rounded-lg">
                <img src={post.photo.image.url} alt={post.id} className="w-full h-64 object-cover rounded-lg" />
                < EmotionChart emotions={post.emotions} />
              </div>
            </a >
          </div>
        </div>
      ))}
    </div>
  );
};
