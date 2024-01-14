import React, { useRef } from 'react'
import { LoadingIndicator } from './LoadingIndicator'
import Webcam from 'react-webcam'
import PhotoCameraIcon from '@mui/icons-material/PhotoCamera'
// import AWS from 'aws-sdk';

const videoConstraints = {
  width: 540,
  facingMode: 'user'
}

export const Camera = () => {
  const webcamRef = useRef(null)

  const [url, setUrl] = React.useState(null)
  const [image, setImage] = React.useState(null)

  const capturePhoto = React.useCallback(async () => {
    const imageSrc = webcamRef.current.getScreenshot()
    setUrl(imageSrc)
    const blob = await fetch(imageSrc).then(r => r.blob())
    const currentTimestamp = new Date().getTime()
    const dynamicFileName = `photo_${currentTimestamp}.jpg`
    const image = new File([blob], dynamicFileName, { type: blob.type })
    setImage(image)
  }, [webcamRef])

  const handleUpload = async () => {
    if (image) {
      const formData = new FormData()
      formData.append('photo[image]', image)

      try {
        const response = await fetch('/photos/create', {
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
          },
          body: formData
        })

        if (response.ok) {
          window.location.href = '/photos/detect_faces'
        } else {
          console.error('Error uploading image to Rails')
        }
      } catch (e) {
        console.error(e)
      }
    }
  }

  return (
    <>
      <div className=" mt-12 lg:mt-20 mx-2 lg:mx-5 fixed bg-yellow-100 border-4 border-yellow-500 relative">
        <div className="bg-custom-bg  bg-cover animate-bg-slide h-[800px] w-full top-0 left-0"></div>
        {url
          ? (
          <>
            <div className="flex justify-center items-center mr-5 lg:mr-0 z-10 absolute top-[40%] lg:top-[37%] left-[5%] lg:left-1/2 lg:-translate-x-1/2 lg: -translate-y-1/2 ">
              <img src={url} alt="Screenshot" style={{ maxWidth: '90%', height: 'auto' }} />
            </div>
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '20px', zIndex: 10, position: 'absolute', top: '78%', left: '50%', transform: 'translate(-50%, -50%)' }}>
              <button onClick={() => setUrl(null)} style={{
                background: 'yellow',
                borderRadius: '50%',
                width: '100px',
                height: '100px',
                border: 'black solid 2px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 'bold'
              }}>再撮影</button>
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
                fontWeight: 'bold'
              }}>分析</button>
            </div>
          </>
            )
          : (
          <>
            < LoadingIndicator />
            <div className="hidden lg:block lg:z-30 text-sky-300 text-xl absolute top-[5%] left-[42%]">顔を青枠に合わせてください</div>
            <div className="hidden lg:block lg:z-30 border-2 border-sky-300 w-[320px] h-[450px] rounded-full absolute top-[10%] left-[36%]"></div>
            <div className="flex justify-center items-center mr-5 lg:mr-0 z-10 absolute top-[40%] lg:top-[37%] left-[5%] lg:left-1/2 lg:-translate-x-1/2 lg: -translate-y-1/2 ">
              <Webcam
                audio={false}
                ref={webcamRef}
                screenshotFormat="image/jpeg"
                className="w-[400px] h-[300px] lg:w-[900px] lg:h-[900px]"
                videoConstraints={videoConstraints}
              />
            </div>
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '10px', zIndex: 10, position: 'absolute', top: '78%', left: '50%', transform: 'translate(-50%, -50%)' }}>
              <button id="capture-photo-button" onClick={capturePhoto} style={{
                background: 'yellow',
                borderRadius: '50%',
                width: '100px',
                height: '100px',
                border: 'black solid 2px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 'bold'
              }}><PhotoCameraIcon fontSize="large" /></button>
            </div>
          </>
            )}
      </div>
    </>
  )
}
