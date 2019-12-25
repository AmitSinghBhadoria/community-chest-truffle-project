const CommunityChest = artifacts.require("CommunityChest");


module.exports = function(deployer) {
  deployer.deploy(CommunityChest);
};
