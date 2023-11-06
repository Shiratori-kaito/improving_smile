import React from 'react';
import { createRoot } from 'react-dom/client';
import {Hello} from './components/Hello';
import {Allcameras} from './components/Allcameras';
import {Camera} from './components/Camera';
import { UserDashboard } from './components/UserDashboard';
import {EmotionChart} from './components/EmotionChart';
import AlreadyLogin from './components/AlreadyLogin';
import {Favorite} from './components/Favorite';




//id＝user-dataがあった場合のみ、UserDashboardをレンダリングする
if (document.getElementById("user-data")) {
  const userDataElement = document.getElementById("user-data");
  const postsString = userDataElement.getAttribute('data-posts');
  const followersString = userDataElement.getAttribute('data-followers'); // 修正点
  const likedPostsString = userDataElement.getAttribute('data-liked-posts');

  const posts = JSON.parse(postsString.replace(/&quot;/g, '"'));
  const followers = JSON.parse(followersString.replace(/&quot;/g, '"'));
  const likedPosts = JSON.parse(likedPostsString.replace(/&quot;/g, '"'));


  const userDashboardRoot = createRoot(userDataElement);
  userDashboardRoot.render(
    <UserDashboard posts={posts} followers={followers} likedPosts={likedPosts} />
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


const emotionCharts = document.querySelectorAll(`[id^='emotion-chart']`);
emotionCharts.forEach(emotionChart => {
  const emotionString = emotionChart.getAttribute('data-emotions');
  const emotionData = JSON.parse(emotionString.replace(/&quot;/g, '"'));
  
  const emotionChartPage = createRoot(emotionChart);
  emotionChartPage.render(
    <EmotionChart emotions={emotionData}/>
  );
});

//id=already-loginがあった場合、AlreadyLoginをレンダリングするが、id=not-loginがあった場合、NotLoginをレンダリングする
if (document.getElementById("already-login")) {
  const alreadyLoginData = document.getElementById("already-login");
  const alreadyLoginId = alreadyLoginData.getAttribute('data-id');
  const alreadyLoginRoot = createRoot(alreadyLoginData);
  alreadyLoginRoot.render(
    <AlreadyLogin user={alreadyLoginId}/>
  );
}

if(document.getElementById("favorite")){
  const favoriteElement = document.getElementById("favorite");
  const favoritePostId = favoriteElement.getAttribute('data-id');
  const favoriteRoot = createRoot(favoriteElement);
  favoriteRoot.render(
    <Favorite post={favoritePostId}/>
  );
}










