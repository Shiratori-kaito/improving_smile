import React from 'react';
import { createRoot } from 'react-dom/client';
import { UserDashboard } from './components/UserDashboard';

//id＝user-dataがあった場合のみ、UserDashboardをレンダリングする
if (document.getElementById("user-data")) {
  const userDataElement = document.getElementById("user-data");
  const postsData = JSON.parse(userDataElement.getAttribute('data-posts'));
  const followersData = JSON.parse(userDataElement.getAttribute('data-followers'));
  const likedPostsData = JSON.parse(userDataElement.getAttribute('data-liked-posts'));
  const userPage = createRoot(userDataElement);

  userPage.render(
    <UserDashboard
      posts={postsData}
      followers={followersData}
      likedPosts={likedPostsData} />
  );
}










