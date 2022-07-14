import HealthCheckItem from "../HealthCheckItem";
import * as S from "./styles";

function HealthCheck(): JSX.Element {
  return (
    <S.HealthCheck>
      <S.Container>
        <S.GeneralStatusAlert>Testado</S.GeneralStatusAlert>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
        <HealthCheckItem title="teste" status="OK"/>
      </S.Container>
    </S.HealthCheck>
  );
}

export default HealthCheck;
