
var TaskVoting = artifacts.require("./TaskVoting.sol")
module.exports = function(deployer, network, accounts) {
  const wallet = web3.eth.accounts[0] // адрес — держатель счёта. Для безопасности рекомендуется использовать multisig
  deployer.deploy(TaskVoting)
}