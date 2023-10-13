import React from 'react';
import { createRoot } from 'react-dom/client';
import { useState } from 'react';
import { UserPosts } from './UserPosts';
import { FollowingUsers } from './FollowingUsers';
import { LikedPosts } from './LikedPosts';

export const UserDashboard = ({ posts, followers, likedPosts }) => {
  const [activeTab, setActiveTab] = useState("UserPosts");

  return (
    <>
      <div>
        <button onClick={() => setActiveTab("UserPosts")}>自分の投稿一覧</button>
        <button onClick={() => setActiveTab("FollowingUsers")}>フォロー中のユーザー</button>
        <button onClick={() => setActiveTab("LikedPosts")}>いいねした投稿</button>
      </div>

      <div>
        {activeTab === "UserPosts" && <UserPosts posts={posts}  />}
        {activeTab === "FollowingUsers" && <FollowingUsers followers={followers} />}
        {activeTab === "LikedPosts" && <LikedPosts likedPosts={likedPosts} />}
      </div>
    </>
  );
}