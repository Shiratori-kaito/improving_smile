
import React, { useState } from "react";

export default function NotLogin() {
  const [openMenu, setOpenMenu] = useState(false);

  const handleMenuOpen = () => {
    setOpenMenu(!openMenu);
  };

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

  const handleLogin = () => {
    window.location.href = "/login";
  }

  return (
    <div className="w-full">
      <div className="fixed w-full top-0 z-50 bg-yellow-400 h-15">
        <header className="flex justify-between py-1 w-full">
          <button onClick={handleHome} type="button" className="py-1">
            <img src="/assets/camera.png" alt="logo"  />
          </button>
          <h1 className="text-white text-5xl font-mono p-4">Smile-Improving</h1>
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
                <button onClick={handleProfile} type="button" className="py-2 inline-block">MyPage</button>
              </li>
              <li className="">
                <button onClick={handleLogin} type="button" className="py-2 inline-block">Login</button>
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
