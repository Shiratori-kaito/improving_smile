import { useState, useEffect } from 'react';
import { getFavoriteStatus } from '../apis/GetFavoriteStatus';
import { toggleFavorite } from '../apis/ToggleFavorite';

export const useFavorite = (post, favoriteCount) => {
  const [favorite, setFavorite] = useState(false);
  const [count, setCount] = useState(Number(favoriteCount));

  useEffect(() => {
    const fetchFavoriteStatus = async () => {
      const data = await getFavoriteStatus(post);
      setFavorite(data.is_favorite);
    };
    fetchFavoriteStatus();
  },[post]);

  const handleFavorite = async () => {
    const method = favorite ? 'DELETE' : 'POST';
    const response = await toggleFavorite(post, method);
    if (response.ok) {
      setFavorite(!favorite);
      setCount(count => favorite ? count -1 : count + 1);
    } else {
      console.error('Error toggling favorite');
    }
  };
  return { favorite, count, handleFavorite };
};