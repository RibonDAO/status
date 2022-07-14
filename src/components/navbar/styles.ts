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

    @media (min-width: 1200px) {
      max-width: 1140px;
    }

    @media (min-width: 1400px) {
        max-width: 1320px;
    }
  `}
`;

export const Navbar = styled.div`
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
    background-color: #fff!important;
    box-shadow: 0px -4px 10px 0px rgb(0 0 0 / 50%);
  `}
`;


export const LeftColumn = styled.div`
  ${() => css`
    padding-top: .3125rem;
    padding-bottom: .3125rem;
    margin-right: 1rem;
    font-size: 1.25rem;
    text-decoration: none;
    white-space: nowrap;
  `}
`;

export const RightColumn = styled.div`
  ${() => css`
    display: inline;
  `}
`;

export const DiscordCTA = styled.a`
  ${() => css`
    box-sizing: border-box;
    display: inline-flex;
    align-items: center;
    font-family: Whitney, "Open Sans", Helvetica, sans-serif;
    font-weight: 400;
    font-size: 11pt;
    border-radius: 3px;
    height: 45px;
    box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.2);
    background-color: #7289da;
    border: 2px solid #7289da;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
    padding-inline: 1rem;

    :hover {
      background-color: #4259aa;
      border: 2px solid #4259aa;
    }
  `}
`;

