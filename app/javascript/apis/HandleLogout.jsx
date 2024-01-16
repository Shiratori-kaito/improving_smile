export const handleLogout = ({ user }) => {
  console.log(user)
  fetch('/logout', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    },
    body: JSON.stringify({ user_id: user }) // 必要に応じてパラメータを追加
  })
    .then(response => {
      if (response.ok) {
        window.location.href = '/login'
      }
    })
    .catch(error => {
      console.error('There was an error with logout:', error)
    })
}
