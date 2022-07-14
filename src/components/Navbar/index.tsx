import * as S from "./styles";
import Logo from "../../assets/logo.png";

function Navbar(): JSX.Element {
  return (
    <S.Navbar>
      <S.Container>
        <S.LeftColumn>
          <img src={Logo} alt="Ribon Logo" width={100}/>
        </S.LeftColumn>
        <S.RightColumn>
          <S.DiscordCTA href="#">Subscribe</S.DiscordCTA>
        </S.RightColumn>
      </S.Container>
    </S.Navbar>
  );
}

export default Navbar;
