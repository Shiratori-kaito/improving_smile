import React from "react";
import { useState } from "react";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart } from '@fortawesome/free-solid-svg-icons'
import { faHeart as regularHeart } from '@fortawesome/free-regular-svg-icons'

export const Favorite = ({post}) => {
  const [favorite, setFavorite] = useState(false);
  console.log(post);
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
      } else {
        console.error('Error toggling favorite');
      }
    });
  };

  return (
    <>
      <div className="flex justify-center item-center bg-green-200 px-20">
        <button onClick={handleFavorite} type="button" className="flex item-center space-y-2 pr-3">
          {favorite ? (
            <FontAwesomeIcon icon={faHeart}  className="text-red-500 text-4xl" />
          ) : (
            <FontAwesomeIcon icon={regularHeart}  className="text-red-500 text-4xl" />
          )}
        </button>
      </div>
    </>
  );
}
