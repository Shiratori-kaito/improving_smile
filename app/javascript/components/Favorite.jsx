import React from "react";
import { useState } from "react";
import { useEffect } from "react";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import { faThumbsUp as regularThumbsUp } from '@fortawesome/free-regular-svg-icons'

export const Favorite = ({post, favoriteCount}) => {
  const [favorite, setFavorite] = useState(false);
  const [count, setCount] = useState(Number(favoriteCount));

  
  useEffect (() => {
    fetch(`/posts/${post}/favorites/favorite_status`, {
      method: 'GET',
      headers: {
        'content-type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
    }).then(response =>  response.json())
      .then(data => {
        setFavorite(data.is_favorite);
      });
  }, []);


  const handleFavorite = () => {
    const method = favorite ? 'DELETE' : 'POST';
    fetch(`/posts/${post}/favorites`, {
      method: method,
      headers: {
      'content-type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ post_id: post })
    }).then(response => {
      if (response.ok) {
        setFavorite(!favorite);
        setCount(count => favorite? count - 1 : count + 1)
      } else {
        console.error('Error toggling favorite');
      }
    });
  };
  console.log(count);

  return (
    <>
      <div className="flex justify-center item-center absolute top-[90%] px-20">
        <button onClick={handleFavorite} type="button" className="flex item-center space-y-2 pr-3">
          {favorite ? (
            <>
              <div className="flex flex-col justify-center items-center">
                <FontAwesomeIcon icon={faThumbsUp} className="text-red-500 text-5xl" />
                <div className="text-red-500 text-xl text-bold">いいね{count}</div>
              </div>
            </>
          ) : (
            <>
              <div className="flex flex-col justify-center items-center">
                <FontAwesomeIcon icon={regularThumbsUp}  className="text-red-500 text-5xl" />
                <div className="text-red-500 text-xl text-bold">いいね{count}</div>
              </div>
            </>
          )}
        </button>
      </div>
    </>
  );
}
