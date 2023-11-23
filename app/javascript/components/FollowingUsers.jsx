import React from 'react';


export const FollowingUsers = ({ followings }) => {
  const flatFollowings = Array.isArray(followings) ? followings.flat() : [];



  return (
    <div className="flex flex-col absolute top-[45%] left-[40%] z-20">
      {flatFollowings.map((following) => (
        <div key={following.id} className="bg-yellow-200 border-2 border-gray-500 rounded-lg shadow p-4 flex items-center space-x-4">

          <a href={`/users/${following.id}`} className="flex items-center space-x-4">
            <img
              className="w-12 h-12 rounded-full"
              src={following.avatar.url === "default_avatar.png" ? `/assets/${following.avatar.url}` : following.avatar.url}
              alt={following.name}
              style={{ objectFit: 'cover' }}
            />
            <div className="text-xl px-5">{following.name}</div>
          </a>
        </div>
      ))}
    </div>
  );
};
