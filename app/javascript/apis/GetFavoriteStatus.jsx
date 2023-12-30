import React from 'react';

export const getFavoriteStatus = async (post) => {
  const response = await fetch(`/posts/${post}/favorites/favorite_status?post_id=${post}`, {
    method: 'GET',
    headers: {
      'content-type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    },
  });
  return response.json();
};