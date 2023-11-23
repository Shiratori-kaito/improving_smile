import React, { useState, useEffect } from 'react';

export const LoadingIndicator = () => {
  const [loading, setLoading] = useState(true);

  useEffect (() => {
    const handleLoad = () => {
      setLoading(false);
    };

    const timer = setTimeout(() => {
      setLoading(false);
    },4000);

    return () => {
      clearTimeout(timer);
    };

  },[]);
  // ローディング状態がtrueのときのみローディングインジケータを表示
  return loading?  (
    <>
      <div className='flex item-center justify-center z-50 absolute top-[4%] left-[25%] h-[550px] w-[700px] bg-custom-bg  bg-cover animate-bg-slide'>
        <div className="z-50 animate-spin h-[120px] w-[120px] border-[5px] border-blue-900  rounded-full border-t-transparent absolute top-[200px]"></div>
        <h2 className='text-3xl text-blue-900 absolute top-[240px]'>Loading</h2>
      </div>
    </>
  ) :null;
};

