import React from "react";
import {useState} from "react";
import { useEffect } from "react";

export const ImagePreview = ( {image} ) => {

  console.log(image);

  const [isBlur, setIsBlur] = useState(false);

  useEffect(() => {
    const handleBlurEvent = (event) => {
    setIsBlur(event.detail);
    };
    window.addEventListener('blurToggle', handleBlurEvent);
    return () => {
      window.removeEventListener('blurToggle', handleBlurEvent);
    }
  },[isBlur]);

  return (
    <>
      <img 
      src={image} 
      className={`${isBlur ? 'blur ' : ''} w-full h-full rounded-lg`} 
      alt="Face" 
    />
    </>
  )
}