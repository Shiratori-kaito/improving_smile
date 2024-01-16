import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'

export const ImagePreview = ({ image }) => {
  const [isBlur, setIsBlur] = useState(false)
  console.log(image)

  ImagePreview.propTypes = {
    image: PropTypes.string.isRequired
  }

  useEffect(() => {
    const handleBlurEvent = (event) => {
      setIsBlur(event.detail)
    }
    window.addEventListener('blurToggle', handleBlurEvent)
    return () => {
      window.removeEventListener('blurToggle', handleBlurEvent)
    }
  }, [isBlur])

  return (
    <>
      <img
      src={image}
      className={`${isBlur ? 'blur ' : ''}  w-full lg:w-[40%] h-full lg:h-[40%] lg:ml-[450px] rounded-lg`}
      alt="Face"
    />
    </>
  )
}
