pragma solidity ^0.4.15;

import './SAToken.sol';
import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';

contract SATokenSale is Crowdsale {
  using SafeMath for uint256;
  uint256 public helpers;
  SAToken public token = new SAToken();

  constructor(
    uint256 _rate,
    address _wallet,
    uint256 _initialMint
  )
    public
    Crowdsale(_rate, _wallet, token)
  {
    token.mint(_wallet, _initialMint);
  }

  function () external payable {
      buyTokens(msg.sender);
  }

  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    // calculate token amount to get
    uint256 weiAmount = msg.value;
    uint256 tokens = weiAmount.mul(rate);
    weiRaised = weiRaised.add(weiAmount);
    helpers = helpers.add(1);

    // double every 3 helpers
    if (helpers % 3 == 0) {
      tokens = tokens.mul(2);
    }

    token.mint(msg.sender, tokens);
    TokenPurchase(beneficiary, beneficiary, weiAmount, tokens);

    _forwardFunds();
  }
}

