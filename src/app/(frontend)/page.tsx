import Hero from './components/sections/Hero'
import About from './components/sections/About'
import Customers from './components/sections/Customers'
import Articles from './components/sections/Articles'
import Recycles from './components/sections/Recycles'

export default async function HomePage() {
  return (
    <>
      <Hero />
      <About />
      <Customers />
      <Articles />
      <Recycles />
    </>
  )
}
