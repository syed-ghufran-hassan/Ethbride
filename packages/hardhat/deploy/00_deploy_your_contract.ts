import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployEthBridge: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  const zkSyncTestnetWalletAddress = "0x2B602d2f559a0bADf4D5956D03f2b330fBC2e9F9";

  // Deploy EthBridge contract
  await deploy("EthBridge", {
    from: deployer,
    args: [zkSyncTestnetWalletAddress],
    log: true,
  });

  console.log("🌉 EthBridge deployed");
};

export default deployEthBridge;

// Set the tags for the deploy script
deployEthBridge.tags = ["EthBridge"];
