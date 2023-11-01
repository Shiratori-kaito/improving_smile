import React from "react";
import { useRef,useEffect } from "react";
import Webcam from "react-webcam";
// import AWS from 'aws-sdk';

const videoConstraints = {
  width: 540,
  facingMode: "user"
};

export const Camera = () => {

  const webcamRef = useRef(null);

  const [url, setUrl] = React.useState(null);
  const [file, setFile] = React.useState(null);

  const capturePhoto = React.useCallback(async () => {
    const imageSrc = webcamRef.current.getScreenshot();
    setUrl(imageSrc);
    const blob = await fetch(imageSrc).then(r => r.blob());
    const currentTimestamp = new Date().getTime();
    const dynamicFileName = `photo_${currentTimestamp}.jpg`;
    const file = new File([blob], dynamicFileName, { type: blob.type });
    setFile(file);
  },[webcamRef]);

  const handleUpload = async () => {
    if (file) {
      const formData = new FormData();
      formData.append('photo[image]', file);
  
      try {
        const response = await fetch('/photos/create', {
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
          },
          body: formData
        });
  
        if (response.ok) {
          window.location.href = '/photos/detect_faces';
        } else {
          console.error("Error uploading image to Rails");
        }
      } catch (e) {
        console.error(e);
      }
    }
  }

  const onUserMedia = (e) => {
    console.log(e);
  }
  return (
    <>
      {url? <>
              <div><img src={url} alt="Screenshot" /></div>
              <button onClick={() => setUrl(null)}>Clear photo</button><button onClick={handleUpload}>Upload</button>
            </>
            :
            <>
              <Webcam
                audio={false}
                ref={webcamRef}
                screenshotFormat="image/jpeg"
                width={540}
                videoConstraints={videoConstraints}
                onUserMedia={onUserMedia} />
                <button onClick={capturePhoto}>Capture photo</button>
            </>

      }
    </>
  );
}

export default Camera;