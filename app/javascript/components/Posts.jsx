import React from 'react';

export const Posts = props =>  {
  // 投稿一覧のロジック
  return (
    <div>
      {props.posts.map((post) => (
        <div key={post.id}>
          <p>{post.content}</p>
        </div>
      ))}
    </div>
  );
}

