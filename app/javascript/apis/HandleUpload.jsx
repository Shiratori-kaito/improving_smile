import React from 'react';

export const handleUpload = async ({image}) => {
  if (image) {
    const formData = new FormData();
    formData.append('photo[image]', image);

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
