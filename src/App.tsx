import HealthCheck from "./components/HealthCheck";
import Navbar from "./components/Navbar";
import GlobalStyle from "./styles/globalStyle";

function App() {
  return (
    <>
      <GlobalStyle />
      <Navbar/>
      <HealthCheck/>
    </>
  );
}

export default App;
