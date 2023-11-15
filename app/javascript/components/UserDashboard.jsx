import React, { useState } from 'react';
import { FollowingUsers } from './FollowingUsers';
import { FollowerUsers } from './FollowerUsers'; // FollowerUsers コンポーネントも必要です。

export const UserDashboard = ({ followers, countFollowers, followings, countFollowings }) => {
  const [activeTab, setActiveTab] = useState(null);
  console.log(followers);
  console.log(followings);
  const toggleTab = (tabName) => {
    // 現在のタブがすでにアクティブな場合は閉じるために null をセットする
    setActiveTab(activeTab === tabName ? null : tabName);
  };

  return (
    <>
      <div>
        <button onClick={() => toggleTab("FollowingUsers")} style={{
          fontSize: "1rem", // textSize ではなく fontSize を使用する
          margin: "5px", // margin の値は "0 5px 0 0" のように書く

        }}>{countFollowings}フォロー</button>
        <button onClick={() => toggleTab("FollowerUsers")} style={{
          fontSize: "1rem", // textSize ではなく fontSize を使用する
          margin: "5px", // margin の値は "0 5px 0 0" のように書く

        }}>{countFollowers}フォロワー</button>
      </div>

      <div>
        {activeTab === "FollowingUsers" && <FollowingUsers followings={followings} />}
        {activeTab === "FollowerUsers" && <FollowerUsers followers={followers} />}
      </div>
    </>
  );
}
