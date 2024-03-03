// https://eth-sepolia.g.alchemy.com/v2/F6Qnlpvozzt72Z4tpdnNKC1BU-ja9vYe
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/F6Qnlpvozzt72Z4tpdnNKC1BU-ja9vYe",
      accounts: ["private_key"],
    },
  },
};
