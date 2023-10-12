import React from 'react';
import { createRoot } from 'react-dom/client';
import {Hello} from './components/Hello';
import {Allcameras} from './components/Allcameras';
import {Camera} from './components/Camera';

const app = document.getElementById('root');
const root = createRoot(app);



const App = () => {
  return (
    <div>
      <Hello />
    </div>
  );
}
root.render(<App />) ;


