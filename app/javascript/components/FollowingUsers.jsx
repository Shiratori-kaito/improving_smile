import React from 'react';

export const FollowingUsers = ({ followers }) => {
  const flatFollowers = followers.flat();

  return (
    <div className="flex flex-col space-y-4">
      {flatFollowers.map(follower => (
        <div key={follower.id} className="flex items-center space-x-4 p-4 border-b border-gray-200">
          {follower.avatar.url === "default_avatar.png" ? (
            <img className="w-12 h-12 rounded-full" src={`/assets/${follower.avatar.url}`} alt={follower.name} />
          ) : (
            <img className="w-12 h-12 rounded-full" src={follower.avatar.url} alt={follower.name} />
          )}
          <span className="text-sm font-medium">{follower.name}</span>
        </div>
      ))}
    </div>
  );
};
