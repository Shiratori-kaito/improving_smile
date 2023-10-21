import React from 'react';
import { createRoot } from 'react-dom/client';
import {Hello} from './components/Hello';
import {Allcameras} from './components/Allcameras';
import {Camera} from './components/Camera';
import { UserDashboard } from './components/UserDashboard';
import {EmotionChart} from './components/EmotionChart';




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


//id=captureがあった場合のみ、Cameraをレンダリングする
if (document.getElementById("capture")) {
  const capture = document.getElementById("capture");
  const capturePage = createRoot(capture);
  capturePage.render(
    <Camera />
  );
}

if (document.getElementById("emotion-chart")) {
  const emotionChart = document.getElementById("emotion-chart");
  const emotionString = emotionChart.getAttribute('data-emotions');
  const emotionData = JSON.parse(emotionString.replace(/&quot;/g, '"'));
  const emotionChartPage = createRoot(emotionChart);
  console.log(emotionData);
  emotionChartPage.render(
    <EmotionChart emotions={emotionData}/>
  );
}




