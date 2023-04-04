// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../../../../script/Deployer.s.sol";
import "../../../helper/TestHelper.sol";

contract BaseModuleBaseTest is Deployer, TestHelper {
    // NOTE: because the contract BaseModule is abstract we test it with the contract BenqiYieldModule

    BaseModule public baseModule;
    address[] rewards = [QI, BTCB];

    function setUp() public {
        loadTestData();

        smartFarmooor = SmartFarmooor(payable(address(0x100)));
        dex = TraderJoeDexModule(address(0x101));

        deployBenqiYieldModuleImpl();
        deployBenqiYieldModule(address(smartFarmooor), address(dex));

        transferOwnershipBenqiYieldModule(OWNER);

        baseModule = benqiYieldModule;
    }

    function testInitIsCorrect() public {
        verifyBenqiYieldModule(OWNER, address(smartFarmooor), address(dex));

        // Check we cannot deploy if the smart farmooor address is zero
        ERC1967Proxy proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be the zero address"));
        benqiYieldModule.initialize(
            address(0), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if the manager address is zero
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be the zero address"));
        benqiYieldModule.initialize(
            address(smartFarmooor), address(0), BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if the base token address is zero
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be the zero address"));
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, address(0), BENQI_EXECUTION_FEE, address(dex), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if the wrapped native token address is zero
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be the zero address"));
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, address(0));
        
        // Check we cannot deploy if the dex address is zero
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be the zero address"));
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(0), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if the rewards length is zero
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        address[] memory emptyRewards = new address[](0);
        vm.expectRevert(bytes("BaseModule: rewards not initialized"));
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), emptyRewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if there are duplicated rewards
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        address[] memory wrongRewards = new address[](2);
        wrongRewards[0] = QI;
        wrongRewards[1] = QI;
        vm.expectRevert(bytes("BaseModule: duplicated rewards"));
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), wrongRewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, BENQI_YIELD_MODULE_NAME, WRAPPED_NATIVE_TOKEN);

        // Check we cannot deploy if the name is the empty string
        proxy = new ERC1967Proxy( address(benqiYieldModuleImpl), "");
        benqiYieldModule = CompoundV2Module(payable(proxy));
        vm.expectRevert(bytes("BaseModule: cannot be empty name"));
        string memory emptyString;
        benqiYieldModule.initialize(
            address(smartFarmooor), MANAGER, BASE_TOKEN, BENQI_EXECUTION_FEE, address(dex), rewards,
            BENQI_COMPTROLLER, BENQI_TOKEN, emptyString, WRAPPED_NATIVE_TOKEN);
    }

    /** helper **/

    function _verifyAllowance() internal {
        assertEq(IERC20(baseModule.rewards(0)).allowance(address(baseModule), address(dex)), type(uint96).max);
        assertEq(IERC20(baseModule.rewards(1)).allowance(address(baseModule), address(dex)), type(uint256).max);
    }

    function _transferOwnershipToTimelock() internal {
        deployTimelock();
        vm.startPrank(OWNER);
        transferOwnershipBenqiYieldModule(address(timelock));
        vm.stopPrank();
    }
}
