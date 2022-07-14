import styled, { css } from "styled-components";

export const Container = styled.div`
  ${() => css`
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    font-family: 'Lato' !important;
    box-sizing: border-box;
    width: 100%;
    padding-right: 1.25rem;
    padding-left: 1.25rem;
    margin-right: auto;
    margin-left: auto;
    max-width: 540px;
    display: flex;
    flex-wrap: inherit;
    align-items: center;
    justify-content: space-between;

    @media (min-width: 576px) {
      max-width: 540px;
    }

    @media (min-width: 768px) {
      max-width: 720px;
    }

    @media (min-width: 992px) {
      max-width: 960px;
    }
  `}
`;

export const HealthCheck = styled.div`
  ${() => css`
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
    font-family: 'Lato' !important;
    box-sizing: border-box;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding-top: .5rem;
    padding-bottom: .5rem;
  `}
`;


export const GeneralStatusAlert = styled.div`
  ${() => css`
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: subpixel-antialiased;
    font-size: 18px;
    line-height: 1.5;
    box-sizing: border-box;
    margin: 0;
    outline: 0;
    vertical-align: baseline;
    background: transparent;
    color: #2ecc71;
    box-shadow: 0 0.25rem 0.75rem rgba(0, 0, 0, 0.05);
    position: relative;
    z-index: 1;
    margin-bottom: 3rem !important;
    font-weight: 500;
    -webkit-border-radius: 4px;
    border: 1px solid rgba(0,0,0,0.1);
    text-shadow: 0 1px 0 rgba(0,0,0,0.1);
    padding: 0.75rem 1.25rem;
    background-color: #28a745;
    width: 100%;
    color: white;
    font-weight: 600;
    text-shadow: 0 1px 0 rgb(0 0 0 / 10%);
  `}
`;

export const StatusColumn = styled.div`
  ${() => css`
    background: white;
    box-shadow: 0 1px 0 rgb(0 0 0 / 10%);
    border-radius: 10px;
    padding-block: 1rem;
    padding-inline: 1.5rem;
    width: 100%;
    margin-bottom: 1rem;
  `}
`;