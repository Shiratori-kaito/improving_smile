import React from "react";
import { useRef,useEffect } from "react";
import Webcam from "react-webcam";
import PhotoCameraIcon from '@mui/icons-material/PhotoCamera';
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
      <div className="mt-40 mx-5 fixed bg-yellow-100 border-4 border-yellow-500 relative">
        <div className="bg-custom-bg  bg-cover animate-bg-slide h-[800px] w-full top-0 left-0"></div>
        {url ? (
          <>
            <div style={{ display: 'flex', justifyContent: 'center', zIndex: 10, position: 'absolute', top: '45%', left: '50%', transform: 'translate(-50%, -50%)' }}>
              <img src={url} alt="Screenshot" style={{ maxWidth: '90%', height: 'auto' }} />
            </div>
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '20px', zIndex: 10, position: 'absolute', top: '90%', left: '50%', transform: 'translate(-50%, -50%)' }}>
              <button onClick={() => setUrl(null)} style={{
                background: 'yellow',
                borderRadius: '50%',
                width: '100px',
                height: '100px',
                border: 'black solid 2px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 'bold',
              }}>Clear photo</button>
              <button onClick={handleUpload} style={{
                marginLeft: '10px',
                background: 'yellow',
                borderRadius: '50%',
                width: '100px',
                height: '100px',
                border: 'black solid 2px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 'bold', }}>Upload</button>
            </div>
          </>
        ) : (
          <>
            <div className="z-30 text-sky-300 text-2xl absolute top-[80px] left-[40%]">顔を青枠に合わせてください</div>
            <div className="z-30 border-2 border-sky-300 w-80 h-96 rounded-full absolute top-[200px] left-[40%]"></div>
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '70vh', zIndex: 10, position: 'absolute', top: '45%', left: '50%', transform: 'translate(-50%, -50%)'  }}>
              <Webcam
                audio={false}
                ref={webcamRef}
                screenshotFormat="image/jpeg"
                width={900}
                height={900}
                videoConstraints={videoConstraints}
                onUserMedia={onUserMedia}
              />
            </div>
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '10px', zIndex: 10, position: 'absolute', top: '92%', left: '50%', transform: 'translate(-50%, -50%)' }}>
              <button onClick={capturePhoto} style={{
                background: 'yellow',
                borderRadius: '50%',
                width: '100px',
                height: '100px',
                border: 'black solid 2px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 'bold',
              }}><PhotoCameraIcon fontSize="large" /></button>
            </div>
          </>
        )}
      </div>
    </>
  );
}

export default Camera;