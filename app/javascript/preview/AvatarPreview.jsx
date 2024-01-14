import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'

export const AvatarPreview = ({ avatar }) => {
  const [imageData, setImageData] = useState(null)

  AvatarPreview.propTypes = {
    avatar: PropTypes.string.isRequired
  }

  const onFileChange = (e) => {
    const files = e.target.files
    if (files.length > 0) {
      const file = files[0]
      const reader = new FileReader()
      reader.onload = (event) => {
        setImageData(event.target.result)
      }
      reader.readAsDataURL(file)
    } else {
      setImageData(null)
    }
  }

  useEffect(() => {
    const hiddenInput = document.getElementById('hiddenAvatarField')
    if (hiddenInput) {
      hiddenInput.value = imageData
    }
  }, [imageData])

  let content = null

  if (imageData) {
    content = (
      <div>
        <img src={imageData} alt='Preview' style={{
          width: '96px',
          height: '96px',
          borderRadius: '9999px',
          objectFit: 'cover'
        }} />
      </div>
    )
  } else if (avatar === 'default_avatar.png') {
    content = (
      <div>
        <img src="/images/default_avatar.png" alt='Preview' style={{
          width: '96px',
          height: '96px',
          borderRadius: '9999px',
          objectFit: 'cover'
        }} />
      </div>
    )
  } else if (avatar) {
    content = (
      <div>
        <img src={avatar} alt='Preview' style={{
          width: '96px',
          height: '96px',
          borderRadius: '9999px',
          objectFit: 'cover'
        }} />
      </div>
    )
  }

  return (
    <div>
      <label htmlFor="file-input" className="cursor-pointer">
        <div className="bg-gray-300 text-black p-2 rounded-md">アバターを選択</div>
      </label>
      <input id="file-input" type="file"
        accept='image/*'
        onChange={onFileChange}
        className="hidden"
      />
      <div className="mt-3">
        {content}
      </div>
    </div>
  )
}
