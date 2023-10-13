import React from 'react';
import { createRoot } from 'react-dom/client';


export const FollowingUsers = ({followers}) => {
  return (
    <div>
        <div key={followers.id}>
          <p>{followers.name}</p>
        </div>
    </div>
  );
};
