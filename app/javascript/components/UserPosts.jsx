import React, { useState, useEffect, useInsertionEffect } from 'react';

export const UserPosts = ({posts}) => {
  const flatPosts = posts.flat();
  console.log(flatPosts);
  const user = flatPosts[0].user;

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
