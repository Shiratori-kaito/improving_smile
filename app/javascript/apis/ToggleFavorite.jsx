export const toggleFavorite = async (post, method) => {
  const response = await fetch(`/posts/${post}/favorites`, {
    method,
    headers: {
      'content-type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    },
    body: JSON.stringify({ post_id: post })
  })
  return response
}
