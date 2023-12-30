import React, { useEffect} from 'react';

export const useDeletePost = ({post, confirm, onSuccess, onFailure}) => {
  useEffect (() => {
    if (confirm){
      fetch(`/posts/${post}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        }
      })
      .then(response => {
        if (response.ok) {
          onSuccess();
        } else {
          onFailure;
        }
      });
    };
  }, [confirm, post, onSuccess, onFailure]);
};
