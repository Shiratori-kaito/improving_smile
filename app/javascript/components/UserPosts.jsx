import React, {useState, useEffect} from 'react';
import { EmotionChart } from './EmotionChart';
import { format } from 'date-fns'
import {ja} from 'date-fns/locale'


export const UserPosts = ({posts}) => {
  const flatPosts = posts.flat();
  const [post, setPost] = useState([]);
  const postUser = flatPosts[0].user_id;
  const formatDate = (date) => {
    return format(new Date(date), 'yyyy/MM/dd', { locale: ja })
  }

  useEffect(() => {
    fetch(`/users/${postUser}`)
    .then((response) => {response.json()})
    .then((data) => {
      setPost(data);
    })
    .catch((e) => { console.error(e); });
  }, []);

console.log(post);
  return (
    <div>
      {posts.map((post) => (
        <div key={post.id}>
          <div className="bg-white rounded-lg shadow p-4 mb-4">
            <a href={`/posts/${post.id}`} className='ml-auto text-gray-500' do >
              <div className="ml-4">
                <p className="text-gray-500">{post.created_at}</p>
              </div>
              <div className="bg-gray-100 p-2 rounded-lg">
                <img src={post.photo.image.url} alt={post.id} className="w-full h-64 object-cover rounded-lg" />
                < EmotionChart emotions={post.emotions} />
              </div>
            </a >
          </div>
        </div>
      ))}
    </div>
  );
};
