import * as S from "./styles";

export type Props = {
  title: string;
  status: string;
};

function HealthCheckItem({ title, status }: Props): JSX.Element {
  return (
    <S.StatusColumn>
      <b>{title}</b>
      <b>{status}</b>
    </S.StatusColumn>
  );
}

export default HealthCheckItem;
