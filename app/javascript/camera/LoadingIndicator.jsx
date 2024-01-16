import React, { useState, useEffect } from 'react'

export const LoadingIndicator = () => {
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(false)
    }, 4000)

    return () => {
      clearTimeout(timer)
    }
  }, [])
  // ローディング状態がtrueのときのみローディングインジケータを表示
  return loading
    ? (
    <>
      <div className='flex item-center justify-center z-40 absolute top-[15%] lg:top-[4%] left-[2%] lg:left-[25%] h-[500px] lg:h-[550px] w-[350px] lg:w-[700px] bg-custom-bg  bg-cover animate-bg-slide'>
        <div className="z-40 animate-spin h-[80px] lg:h-[120px] w-[80px] lg:w-[120px] border-[4px] lg:border-[5px] border-blue-900  rounded-full border-t-transparent absolute top-[90px] lg:top-[200px]"></div>
        <h2 className='text-xl lg:text-3xl text-blue-900 absolute top-[120px] lg:top-[240px]'>Loading</h2>
      </div>
    </>
      )
    : null
}
