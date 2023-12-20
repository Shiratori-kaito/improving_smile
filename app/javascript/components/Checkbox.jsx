import React from "react";
import {useState} from "react";
import { useEffect } from "react";

export const Checkbox = ()  => {

  const [isBlur, setIsBlur] = useState(false);

  const handleBlur = () => {
    const newIsBlur = !isBlur;
    setIsBlur(newIsBlur);

    const event = new CustomEvent('blurToggle',{detail:newIsBlur});
    window.dispatchEvent(event);
  }

  useEffect(() => {
    const hiddenInput = document.getElementById('hiddenBlurInput');
    if (hiddenInput) {
      hiddenInput.value = isBlur;
    }
  },[isBlur]);

  return (
    <>
      <label>
        <input
          type="checkbox"
          checked={isBlur}
          onChange={handleBlur}
          className="mt-1 mr-1 mb-2"
        />
        投稿時に顔写真をぼかします
      </label>
    </>
  )
}
