import * as React from 'react'
import { ChakraProvider } from '@chakra-ui/react'
import { ScrollTop } from './ScrollTop'

export const ReturnTop = () => {
  return (
    <ChakraProvider>
      <ScrollTop />
    </ChakraProvider>
  )
}