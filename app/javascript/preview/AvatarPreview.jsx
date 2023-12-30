import React, { useState, useEffect } from 'react';

export const AvatarPreview = ({avatar}) => {
  const [imageData, setImageData] = useState(null);

  const onFileChange = (e) => {
    const files = e.target.files;
    if (files.length > 0) {
      const file = files[0];
      const reader = new FileReader();
      reader.onload = (event) => {
        setImageData(event.target.result);
      };
      reader.readAsDataURL(file);
    } else {
      setImageData(null);
    }
  };

  useEffect(() => {
    const hiddenInput = document.getElementById('hiddenAvatarField');
    console.log(hiddenInput); // hiddenInput 要素自体をログに出力
    if (hiddenInput) {
      hiddenInput.value = imageData;
      console.log(hiddenInput.value); // hiddenInput の値をログに出力
    }
  }, [imageData]);

  let content = null;

  if(imageData){
    content = (
      <div>
        <img src={imageData} alt='Preview' style={{
                                                  width: '96px',
                                                  height: '96px',
                                                  borderRadius: '9999px',
                                                  objectFit: 'cover'
                                                  }} />
      </div>
    );
  }else if (avatar === 'default_avatar.png'){
    content = (
      <div>
        <img src="/images/default_avatar.png" alt='Preview' style={{
                                                  width: '96px',
                                                  height: '96px',
                                                  borderRadius: '9999px',
                                                  objectFit: 'cover'
                                                  }} />
      </div>
    );
  }else if (avatar){
    content = (
      <div>
        <img src={avatar} alt='Preview' style={{
                                                  width: '96px',
                                                  height: '96px',
                                                  borderRadius: '9999px',
                                                  objectFit: 'cover'
                                                  }} />
      </div>
    );
  }

  return (
    <div>
      <input type="file" 
        accept='image/*' 
        onChange={onFileChange}
      />
      <div className="mt-3">
        {content}
      </div>
    </div>
  );
};
