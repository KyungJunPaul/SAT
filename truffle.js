var credentials = require('./credentials');
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = credentials.mnemonic;
var infuraKey = credentials.infuraKey;


module.exports = {
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks: {
    mainnet: {
      provider: new HDWalletProvider(mnemonic, `https://mainnet.infura.io/${infuraKey}`, 1),
      network_id: 1,
      gas: 3000000,
      gasPrice: 3000000000, // 3 gwei
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, `https://ropsten.infura.io/${infuraKey}`, 0),
      network_id: 3,
      gas: 3000000,
      gasPrice: 1000000000, // 1.2 gwei
    }
  }
}
