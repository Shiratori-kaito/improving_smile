import React from "react";
import {useState} from "react";

export const Checkbox = ()  => {

  const [isBlur, setIsBlur] = useState(false);

  const handleBlur = () => {
    const newIsBlur = !isBlur;
    setIsBlur(newIsBlur);

    const event = new CustomEvent('blurToggle',{detail:newIsBlur});
    window.dispatchEvent(event);
  }

  return (
    <>
      <label>
        <input
          type="checkbox"
          checked={isBlur}
          onChange={handleBlur}
          className="mt-1 mr-1 mb-"
        />
        投稿時に顔写真をぼかします
      </label>
    </>
  )
}
