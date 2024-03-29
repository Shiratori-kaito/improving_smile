import React from 'react'
import { createRoot } from 'react-dom/client'
import { Camera } from './camera/Camera'
import { UserDashboard } from './user/UserDashboard'
import { EmotionChart } from './posts/EmotionChart'
import AlreadyLogin from './header/AlreadyLogin'
import NotLogin from './header/NotLogin'
import { Favorite } from './posts/Favorite'
import { PostDelete } from './posts/PostDelete'
import { Checkbox } from './posts/Checkbox'
import { ImagePreview } from './posts/ImagePreview'
import { AvatarPreview } from './preview/AvatarPreview'
import { ReturnTop } from './pages/ReturnTop'

if (document.getElementById('user-data')) {
  const userDataElement = document.getElementById('user-data')
  const followersString = userDataElement.getAttribute('data-followers')
  const followingsString = userDataElement.getAttribute('data-followings')
  const countFollowers = userDataElement.getAttribute('data-countfollowers')
  const countFollowings = userDataElement.getAttribute('data-countfollowings')
  const followers = JSON.parse(followersString.replace(/&quot;/g, '"'))
  const followings = JSON.parse(followingsString.replace(/&quot;/g, '"'))
  const userDashboardRoot = createRoot(userDataElement)
  userDashboardRoot.render(
    <UserDashboard followers={followers} followings={followings} countFollowers={countFollowers} countFollowings={countFollowings} />
  )
}

if (document.getElementById('capture')) {
  const capture = document.getElementById('capture')
  const capturePage = createRoot(capture)
  capturePage.render(
    <Camera />
  )
}

const emotionCharts = document.querySelectorAll('[id^=\'emotion-chart\']')
emotionCharts.forEach(emotionChart => {
  const emotionString = emotionChart.getAttribute('data-emotions')
  const height = emotionChart.getAttribute('data-height')
  const emotionData = JSON.parse(emotionString.replace(/&quot;/g, '"'))
  const emotionChartPage = createRoot(emotionChart)
  emotionChartPage.render(
    <EmotionChart emotions={emotionData} height={height}/>
  )
})

if (document.getElementById('already-login')) {
  const alreadyLoginData = document.getElementById('already-login')
  const alreadyLoginId = alreadyLoginData.getAttribute('data-id')
  const alreadyLoginRoot = createRoot(alreadyLoginData)
  alreadyLoginRoot.render(
    <AlreadyLogin user={alreadyLoginId}/>
  )
}

if (document.getElementById('not-login')) {
  const notLoginData = document.getElementById('not-login')
  const notLoginRoot = createRoot(notLoginData)
  notLoginRoot.render(
    <NotLogin />
  )
}

if (document.getElementById('favorite')) {
  const favoriteElement = document.getElementById('favorite')
  const favoritePostId = favoriteElement.getAttribute('data-id')
  const favoriteCount = favoriteElement.getAttribute('data-count')
  const favoriteRoot = createRoot(favoriteElement)

  favoriteRoot.render(
    <Favorite post={favoritePostId} favoriteCount={favoriteCount}/>
  )
}

if (document.getElementById('trash')) {
  const trashElement = document.getElementById('trash')
  const trashPostID = trashElement.getAttribute('data-id')
  const trashRoot = createRoot(trashElement)
  trashRoot.render(
    <PostDelete post={trashPostID}/>
  )
}

if (document.getElementById('checkbox')) {
  const checkboxElement = document.getElementById('checkbox')
  const checkboxRoot = createRoot(checkboxElement)
  checkboxRoot.render(
    <Checkbox />
  )
}

if (document.getElementById('image-preview')) {
  const imagePreviewElement = document.getElementById('image-preview')
  const image = imagePreviewElement.getAttribute('data-image')
  const imagePreviewRoot = createRoot(imagePreviewElement)
  imagePreviewRoot.render(
    <ImagePreview image={image} />
  )
}

if (document.getElementById('avatarPreview')) {
  const avatarPreviewElement = document.getElementById('avatarPreview')
  const avatar = avatarPreviewElement.getAttribute('data-avatar')
  const avatarPreviewRoot = createRoot(avatarPreviewElement)
  avatarPreviewRoot.render(
    <AvatarPreview avatar={avatar}/>
  )
}

if (document.getElementById('returnTop')){
  const returnTopElement = document.getElementById('returnTop')
  const returnTopRoot = createRoot(returnTopElement)
  returnTopRoot.render(
    <ReturnTop />
  )
}
