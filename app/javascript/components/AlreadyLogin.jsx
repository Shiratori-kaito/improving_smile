
import React, { useState } from "react";

export default function AlreadyLogin({user}) {
  const [openMenu, setOpenMenu] = useState(false);


  const handleMenuOpen = () => {
    setOpenMenu(!openMenu);
  };

  const handleMypage = () => {
    window.location.href = `/users/${user}`
  }


  const handlePostsIndex = () => {
    window.location.href = "/posts";
  }

  const handleProfile = () => {
    window.location.href = "/profile";
  }

  const handleHome = () => {
    window.location.href = "/";
  }

  const handlePolicy = () => {
    window.location.href = "/pages/policy";
  }

  const handleabout = () => {
    window.location.href = "/pages/about";
  }

  const handleMyTwitter = () => {
    window.location.href = "https://twitter.com/nvrl623";
  }

  const handleLogout = () => {
    fetch('/logout', {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ user_id: user.id })  // 必要に応じてパラメータを追加
    })
    .then(response => {
      if (response.ok) {
        window.location.href = "/login";
      }
    })
    .catch(error => {
      console.error('There was an error with logout:', error);
    });
  };

  return (
    <div className="w-full">
      <div className="fixed w-full top-0 z-50 bg-yellow-400 h-15">
        <header className="flex justify-between py-1 w-full">
          <button onClick={handleHome} type="button" className="py-1">
            <img src="/images/camera.png" alt="logo"  />
          </button>
          <div className="flex justify-center">
            <h1 className="text-white text-7xl pr-10">Face</h1>
            <h1 className="text-white text-7xl pl-10">World</h1>
          </div>
          {/* humbergerbutton */}
          <button onClick={handleMenuOpen} type="button" className="z-10 space-y-2 pr-3">
            <div
              className={
                openMenu
                  ? 'w-10 h-0.5 bg-gray-600 translate-y-2.5 rotate-45 transition duration-500 ease-in-out'
                  : 'w-10 h-0.5 bg-gray-600 transition duration-500 ease-in-out'
              }
            />
            <div
              className={
                openMenu
                  ? 'opacity-0 transition duration-500 ease-in-out'
                  : 'w-10 h-0.5 bg-gray-600 transition duration-500 ease-in-out'
              }
            />
            <div
              className={
                openMenu
                  ? 'w-10 h-0.5 bg-gray-600 -rotate-45 transition duration-500 ease-in-out'
                  : 'w-10 h-0.5 bg-gray-600 transition duration-500 ease-in-out'
              }
            />
          </button>

          {/* nav */}
          <nav
            className={
              openMenu
                ? 'text-left fixed bg-slate-50 right-0 top-0 w-4/12 h-screen flex flex-col justify-start pt-8 px-3 ease-linear duration-300'
                : 'fixed right-[-100%] ease-linear duration-300'
            }
          >
            <ul className="mt-6">
              <li className="">
                <button onClick={handleMypage} type="button" className="py-2 inline-block">マイページ</button>
              </li>
              <li className="">
                <button onClick={handlePostsIndex} type="button" className="py-2 inline-block">投稿一覧</button>
              </li>
              <li className="">
                <button onClick={handleProfile} type="button" className="py-2 inline-block">アカウント管理</button>
              </li>
              <li className="">
                <button onClick={handleLogout} type="button" className="py-2 inline-block">ログアウト</button>
              </li>
              <li className="pt-10">
                <button onClick={handlePolicy} type="button" className="py-2 inline-block">プライバシーポリシー</button>
              </li>
              <li className="">
                <button onClick={handleabout} type="button" className="py-2 inline-block">利用規約</button>
              </li>
              <li className="">
                <button onClick={handleMyTwitter} type="button" className="py-2 inline-block">運営元</button>
              </li>
            </ul>
          </nav>
        </header>
      </div>
    </div>
  );
}
