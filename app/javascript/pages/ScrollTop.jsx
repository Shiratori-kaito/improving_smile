import React, { useEffect, useState } from "react";
import { Icon } from "@chakra-ui/react";
import { RiArrowUpSLine } from "react-icons/ri";

export const ScrollTop = () => {
  const [showButton, setShowButton] = useState(false);

  useEffect(() => {
    const watchScroll = () => {
      const basePosition = 200;
      const scrollPosition = window.scrollY;
      if (basePosition <= scrollPosition) {
        setShowButton(true);
      } else {
        setShowButton(false);
      }
    };

    window.addEventListener("scroll", watchScroll);
    return () => {
      window.removeEventListener("scroll",watchScroll);
    };
  },[]);

  return (
    <Icon
      display={showButton ? "block" : "none"} // ボタンをToggle
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}  // 上までSmoothスクロール
      cursor="pointer"
      position="fixed"
      right={6}
      bottom={6}
      as={RiArrowUpSLine}
      bgColor="gray.300"
      color="gray.500"
      w={14}
      h={14}
      rounded="full"
      p={2}
      boxShadow="md"
      _hover={{
        bgColor: "gray.200",
      }}
    />
  );
};