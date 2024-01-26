import { useState } from 'react'

export const useConfirm = (message) => {
  const [confirm, setConfirm] = useState(false)

  const handleConfirm = () => {
    if (window.confirm('投稿を削除しますか？')) {
      setConfirm(true)
    };
  }

  return { confirm, handleConfirm }
}
