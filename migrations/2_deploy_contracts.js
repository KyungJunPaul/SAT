var SATokenSale = artifacts.require("./SATokenSale.sol");
var address = require('../credentials').wallet;

module.exports = function(deployer) {
  const rate = 10000;
  const wallet = address;
  const initialMintToken = rate * 100000000000000000000; // 100 ETH
  deployer.deploy(SATokenSale,
    rate, // rate
    wallet, // wallet
    initialMintToken,
  )
}
