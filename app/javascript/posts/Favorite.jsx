import React from "react";
import { useState } from "react";
import { useEffect } from "react";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import { faThumbsUp as regularThumbsUp } from '@fortawesome/free-regular-svg-icons'
import { useFavorite } from "../hooks/UseFavorite";
export const Favorite = ({post, favoriteCount}) => {
  const { favorite, count, handleFavorite } = useFavorite(post, favoriteCount);
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
