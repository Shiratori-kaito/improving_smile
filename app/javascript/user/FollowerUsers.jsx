import React from 'react';


export const FollowerUsers = ({ followers }) => {
  const flatFollowers = Array.isArray(followers) ? followers.flat() : [];

 

  return (
    <div className="flex flex-col absolute top-[45%] left-[45%] z-20 ">
      {flatFollowers.map((follower) => (
        <div key={follower.id} className="bg-yellow-200 border-2 border-gray-500 rounded-lg shadow p-4  flex items-center space-x-4">
          {/* 通常のaタグを使ってリンクを作成 */}
          <a href={`/users/${follower.id}`} className="flex items-center space-x-4">
            <img
              className="w-12 h-12 rounded-full"
              src={follower.avatar.url === "default_avatar.png" ? `/assets/${follower.avatar.url}` : follower.avatar.url}
              alt={follower.name}
              style={{ objectFit: 'cover' }} // 画像が正しくフィットするようにobjectFitを使用
            />
            <div className="text-xl px-5">{follower.name}</div>
          </a>
        </div>
      ))}
    </div>
  );
};
