import React from 'react';


export const FollowerUsers = ({ followers }) => {
  const flatFollowers = Array.isArray(followers) ? followers.flat() : [];

 

  return (
    <div className="flex flex-wrap absolute top-[37%] left-[45%] z-20 w-[25%]">
      {flatFollowers.map((follower) => (
        <div key={follower.id} className="bg-yellow-200 border-2 border-gray-500 rounded-lg shadow p-4 w-[150px] flex items-center space-x-4">
          {/* 通常のaタグを使ってリンクを作成 */}
          <a href={`/users/${follower.id}`} className="flex items-center space-x-4">
            <img
              className="w-12 h-12 rounded-full"
              src={follower.avatar.url}
              alt={follower.name}
              style={{ objectFit: 'cover' }} // 画像が正しくフィットするようにobjectFitを使用
            />
            <div className="text-xl">{follower.name}</div>
          </a>
        </div>
      ))}
    </div>
  );
};
