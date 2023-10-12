import React from "react";
import { useRef,useEffect } from "react";
import Webcam from "react-webcam";

const videoConstraints = {
  width: 540,
  facingMode: "user"
};

export const Camera = () => {

  const webcamRef = useRef(null);

  const [url, setUrl] = React.useState(null);

  const capturePhoto = React.useCallback(async () => {
    const imageSrc = webcamRef.current.getScreenshot();
    setUrl(imageSrc);
  },[webcamRef])

  const onUserMedia = (e) => {
    console.log(e);
  }
  return (
    <>
      <Webcam
        audio={false}
        ref={webcamRef}
        screenshotFormat="image/jpeg"
        width={540}
        videoConstraints={videoConstraints}
        onUserMedia={onUserMedia}
      />
      <button onClick={capturePhoto}>Capture photo</button>
      <button onClick={() => setUrl(null)}>Clear photo</button>

      {url && (
        <div>
          <img src={url} alt="Screenshot" />
        </div>
      )}
    </>
  );
}

export default Camera;