import React from 'react';
import { useState } from "react";
import { useEffect } from "react";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faTrashAlt } from '@fortawesome/free-solid-svg-icons';

export const PostDelete = ({post}) => {
  const [confirm, setConfirm] = useState(false);

  const handleConfirm = () => {
    if (window.confirm('投稿を削除しますか？')){
      setConfirm(true);
    };
  };

  const redirectToPreviousPage = () => {
    window.history.back();
    setTimeout(() => {
      window.location.reload();
    }, 100);
  }

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
          redirectToPreviousPage();
        } else {
          console.error('Error deleting post');
        }
      });
    };
  }, [confirm]);


  return (
    <>
      <div className="flex justify-center item-center absolute top-[90%] left-[90%] px-20">
        <button onClick={handleConfirm} type="button" >
          <FontAwesomeIcon icon={faTrashAlt} className="text-gray-500 text-5xl" />
        </button>
      </div>
    </>
  );
};