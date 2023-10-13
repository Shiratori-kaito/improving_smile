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
    const file = new File([blob], "image.jpg", { type: blob.type });
    setFile(file);
  },[webcamRef]);

  const handleUpload = async () => {
    if (file) {
      // RailsのAPIから署名付きURLを取得
      const response = await fetch('/presigned_url?filename=image.jpg', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        }
      });
      const { url } = await response.json();
  
      // S3へのアップロード
      await fetch(url, {
        method: 'PUT',
        body: file,
        headers: {
          'Content-Type': file.type
        }
      });
      
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