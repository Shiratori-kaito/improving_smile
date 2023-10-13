import React from 'react';
import { createRoot } from 'react-dom/client';
import {Hello} from './components/Hello';
import {Allcameras} from './components/Allcameras';
import {Camera} from './components/Camera';


//id=captureがあった場合のみ、Cameraをレンダリングする
if (document.getElementById("capture")) {
  const capture = document.getElementById("capture");
  const capturePage = createRoot(capture);
  capturePage.render(
    <Camera />
  );
}




