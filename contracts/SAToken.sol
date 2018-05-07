pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract SAToken is MintableToken {
  string public name = "SAT TOKEN";
  string public symbol = "SAT";
  uint8 public decimals =  18;
  string public note = "Please help me start again.";
}
