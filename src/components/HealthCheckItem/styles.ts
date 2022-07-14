import styled, { css } from "styled-components";

export const StatusColumn = styled.div`
  ${() => css`
    background: white;
    box-shadow: 0 1px 0 rgb(0 0 0 / 10%);
    border-radius: 10px;
    padding-block: 1rem;
    padding-inline: 1.5rem;
    width: 100%;
    margin-bottom: 1rem;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
  `}
`;

