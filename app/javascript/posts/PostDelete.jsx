import React from 'react'
import PropTypes from 'prop-types'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faTrashAlt } from '@fortawesome/free-solid-svg-icons'
import { useConfirm } from '../hooks/UseConfirm'
import { useDeletePost } from '../hooks/UseDeletePost'

export const PostDelete = ({ post }) => {
  const { confirm, handleConfirm } = useConfirm('投稿を削除しますか？')

  PostDelete.propTypes = {
    post: PropTypes.number.isRequired
  }

  const redirectToPreviousPage = () => {
    window.history.back()
    console.log('deleted')
    setTimeout(() => {
      window.location.reload(true)
    }, 1000)
  }

  useDeletePost({ post, confirm, onSuccess: redirectToPreviousPage, onFailure: () => console.error('投稿を削除できませんでした') })

  return (
    <>
      <div className="flex justify-center item-center absolute top-[95%] lg:top-[90%] left-[91%] lg:left-[90%] ">
        <button onClick={handleConfirm} type="button" >
          <FontAwesomeIcon icon={faTrashAlt} className="text-gray-500 text-2xl lg:text-5xl" />
        </button>
      </div>
    </>
  )
}
