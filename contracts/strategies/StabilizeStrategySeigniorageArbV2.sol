// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);
    
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.6.0;

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol

pragma solidity ^0.6.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _governance;

    event GovernanceTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _governance = msgSender;
        emit GovernanceTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function governance() public view returns (address) {
        return _governance;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyGovernance() {
        require(_governance == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferGovernance(address newOwner) internal virtual onlyGovernance {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit GovernanceTransferred(_governance, newOwner);
        _governance = newOwner;
    }
}

// File: contracts/strategies/StabilizeStrategySeigniorageArbV2.sol

pragma solidity ^0.6.6;

// This is a strategy that takes advantage of price volatility of seigniorage tokens
// Users deposit various tokens into the strategy and the strategy will sell into the lowest priced token
// Selling will occur via Uniswap and buying WETH via Uniswap too
// Half the profit earned from the sell will be used to buy WETH and split it between the treasury, executor and staking pool
// Half will remain as seigniorage tokens

// This strategy uses optimizations to reduce gas fees such as trading only on large exits (greater than 10% pool - modifiable)

interface StabilizeStakingPool {
    function notifyRewardAmount(uint256) external;
}

interface UniswapRouter {
    function WETH() external pure returns (address); // Get address for WETH
    function swapExactTokensForTokens(uint, uint, address[] calldata, address, uint) external returns (uint[] memory);
    function getAmountsOut(uint, address[] calldata) external view returns (uint[] memory); // For a value in, it calculates value out
}

contract StabilizeStrategySGRArbV2 is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;
    
    address public treasuryAddress; // Address of the treasury
    address public stakingAddress; // Address to the STBZ staking pool
    address public zsTokenAddress; // The address of the controlling zs-Token
    
    uint256 constant divisionFactor = 100000;
    uint256 public lastTradeTime;
    uint256 public maxPoolSize = 20000000e18; // The maximum amount of seigniorage tokens this strategy can hold, 20 mil by default
    uint256 public lastActionBalance = 0; // Balance before last deposit or withdraw
    bool public tradeInExpansionOnly = true; // This will toggle whether the strategy will sell only above 1 of its stablecoin pair
    uint256 public percentTradeTrigger = 10000; // 10% change in value will trigger a trade
    uint256 public percentSell = 10000; // 10% of the tokens are sold to the cheapest token
    uint256 public maxAmountSell = 200000; // The maximum amount of tokens that can be sold at once
    uint256 public percentDepositor = 50000; // 1000 = 1%, depositors earn 50% of all gains
    uint256 public percentExecutor = 20000; // 20000 = 20% of WETH goes to executor
    uint256 public percentStakers = 50000; // 50% of non-depositors WETH goes to stakers, can be changed
    uint256 public minTradeSplit = 1000; // If the balance is less than or equal to this, it trades the entire balance
    uint256 constant minGain = 1e16; // Minimum amount of gain (0.01 coin) before buying WETH and splitting it
    
    // Token information
    // This strategy accepts multiple btc proxies
    // ESD, DSD, BAC
    struct TokenInfo {
        IERC20 token; // Reference of token
        uint256 decimals; // Decimals of token
        address pairedToken; // Token address of paired token with most liquidity
        uint256 pairedTokenDecimals;
    }
    
    TokenInfo[] private tokenList; // An array of tokens accepted as deposits

    // Strategy specific variables
    address constant uniswapRouterAddress = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D); //Address of Uniswap
    address constant usdcAddress = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    address constant daiAddress = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);

    constructor(
        address _treasury,
        address _staking,
        address _zsToken
    ) public {
        treasuryAddress = _treasury;
        stakingAddress = _staking;
        zsTokenAddress = _zsToken;
        setupWithdrawTokens();
    }

    // Initialization functions
    
    function setupWithdrawTokens() internal {
        // Start with ESD
        IERC20 _token = IERC20(address(0x36F3FD68E7325a35EB768F1AedaAe9EA0689d723));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                pairedToken: usdcAddress, // USDC is highest liquid pair
                pairedTokenDecimals: IERC20(usdcAddress).decimals()
            })
        );   
        
        // DSD
        _token = IERC20(address(0xBD2F0Cd039E0BFcf88901C98c0bFAc5ab27566e3));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                pairedToken: usdcAddress, // USDC
                pairedTokenDecimals: IERC20(usdcAddress).decimals()
            })
        );
        
        // BAC
        _token = IERC20(address(0x3449FC1Cd036255BA1EB19d65fF4BA2b8903A69a));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                pairedToken: daiAddress, // DAI
                pairedTokenDecimals: IERC20(daiAddress).decimals()
            })
        );
    }
    
    // Modifier
    modifier onlyZSToken() {
        require(zsTokenAddress == _msgSender(), "Call not sent from the zs-Token");
        _;
    }
    
    // Read functions
    
    function rewardTokensCount() external view returns (uint256) {
        return tokenList.length;
    }
    
    function rewardTokenAddress(uint256 _pos) external view returns (address) {
        require(_pos < tokenList.length,"No token at that position");
        return address(tokenList[_pos].token);
    }
    
    function balance() public view returns (uint256) {
        return getNormalizedTotalBalance(address(this));
    }
    
    function getNormalizedTotalBalance(address _address) public view returns (uint256) {
        uint256 _balance = 0;
        for(uint256 i = 0; i < tokenList.length; i++){
            uint256 _bal = tokenList[i].token.balanceOf(_address);
            _bal = _bal.mul(1e18).div(10**tokenList[i].decimals);
            _balance = _balance.add(_bal); // This has been normalized to 1e18 decimals
        }
        return _balance;
    }
    
    function withdrawTokenReserves() public view returns (address, uint256) {
        // This function will return the address and amount of the token with the highest balance
        uint256 length = tokenList.length;
        uint256 targetID = 0;
        uint256 targetNormBalance = 0;
        for(uint256 i = 0; i < length; i++){
            uint256 _normBal = tokenList[i].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[i].decimals);
            if(_normBal > 0){
                if(targetNormBalance == 0 || _normBal >= targetNormBalance){
                    targetNormBalance = _normBal;
                    targetID = i;
                }
            }
        }
        if(targetNormBalance > 0){
            return (address(tokenList[targetID].token), tokenList[targetID].token.balanceOf(address(this)));
        }else{
            return (address(0), 0); // No balance
        }
    }
    
    // Write functions
    
    function enter() external onlyZSToken {
        deposit(false);
    }
    
    function exit() external onlyZSToken {
        // The ZS token vault is removing all tokens from this strategy
        withdraw(_msgSender(),1,1, false);
    }
    
    function deposit(bool nonContract) public onlyZSToken {
        // Only the ZS token can call the function
        
        // No trading is performed on deposit
        if(nonContract == true){ }
        lastActionBalance = balance();
        require(lastActionBalance <= maxPoolSize,"This strategy has reached its maximum balance");
    }
    
    function withdraw(address _depositor, uint256 _share, uint256 _total, bool nonContract) public onlyZSToken returns (uint256) {
        require(balance() > 0, "There are no tokens in this strategy");
        if(nonContract == true){
            if(_share > _total.mul(percentTradeTrigger).div(divisionFactor)){
                checkAndSwapTokens(_depositor);
            }
        }
        
        uint256 withdrawAmount = 0;
        uint256 _balance = balance();
        if(_share < _total){
            uint256 _myBalance = _balance.mul(_share).div(_total);
            withdrawPerBalance(_depositor, _myBalance, false); // This will withdraw based on token balance
            withdrawAmount = _myBalance;
        }else{
            // We are all shares, transfer all
            withdrawPerBalance(_depositor, _balance, true);
            withdrawAmount = _balance;
        }       
        lastActionBalance = balance();
        
        return withdrawAmount;
    }
    
    // This will withdraw the tokens from the contract based on their balance, from highest balance to lowest
    function withdrawPerBalance(address _receiver, uint256 _withdrawAmount, bool _takeAll) internal {
        uint256 length = tokenList.length;
        if(_takeAll == true){
            // Send the entire balance
            for(uint256 i = 0; i < length; i++){
                uint256 _bal = tokenList[i].token.balanceOf(address(this));
                if(_bal > 0){
                    tokenList[i].token.safeTransfer(_receiver, _bal);
                }
            }
            return;
        }
        bool[4] memory done;
        uint256 targetID = 0;
        uint256 targetNormBalance = 0;
        for(uint256 i = 0; i < length; i++){
            
            targetNormBalance = 0; // Reset the target balance
            // Find the highest balanced token to withdraw
            for(uint256 i2 = 0; i2 < length; i2++){
                if(done[i2] == false){
                    uint256 _normBal = tokenList[i2].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[i2].decimals);
                    if(targetNormBalance == 0 || _normBal >= targetNormBalance){
                        targetNormBalance = _normBal;
                        targetID = i2;
                    }
                }
            }
            done[targetID] = true;
            
            // Determine the balance left
            uint256 _normalizedBalance = tokenList[targetID].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[targetID].decimals);
            if(_normalizedBalance <= _withdrawAmount){
                // Withdraw the entire balance of this token
                if(_normalizedBalance > 0){
                    _withdrawAmount = _withdrawAmount.sub(_normalizedBalance);
                    tokenList[targetID].token.safeTransfer(_receiver, tokenList[targetID].token.balanceOf(address(this)));                    
                }
            }else{
                // Withdraw a partial amount of this token
                if(_withdrawAmount > 0){
                    // Convert the withdraw amount to the token's decimal amount
                    uint256 _balance = _withdrawAmount.mul(10**tokenList[targetID].decimals).div(1e18);
                    _withdrawAmount = 0;
                    tokenList[targetID].token.safeTransfer(_receiver, _balance);
                }
                break; // Nothing more to withdraw
            }
        }
    }
    
    function getCheapestUniswapToken() internal view returns (uint256) {
        // This will give us the ID of the cheapest token on Uniswap
        // We will estimate the return for trading 1000 ESD
        // The higher the return, the lower the price of the other token
        uint256 targetID = 0; // Our target ID is ESD first
        UniswapRouter router = UniswapRouter(uniswapRouterAddress);
        uint256 esdAmount = uint256(1000).mul(10**tokenList[0].decimals);
        uint256 highAmount = esdAmount;
        for(uint256 i = 1; i < tokenList.length; i++){
            address[] memory path = findRoute(address(tokenList[0].token), address(tokenList[i].token), false); // Finds route from token 1 to token 2
            uint256[] memory estimates = router.getAmountsOut(esdAmount, path);
            
            // Normalize the estimate into ESD decimals
            uint256 estimate = estimates[estimates.length - 1]; // This is the amount of target tokens
            estimate = estimate.mul(10**tokenList[0].decimals).div(10**tokenList[i].decimals);
            if(estimate > highAmount){
                // This token is worth less than the ESD
                highAmount = estimate;
                targetID = i;
            }
        }
        return targetID;
    }
    
    function expansionPhase(uint256 tokenID) internal view returns (bool) {
        // This will estimate whether the token is in expansion or contraction based on its paired stablecoin token
        // This is a rough estimate that is not consequential if wrong
        UniswapRouter router = UniswapRouter(uniswapRouterAddress);
        uint256 tokenAmount = uint256(10).mul(10**tokenList[tokenID].decimals); 
        address[] memory path = new address[](2);
        path[0] = address(tokenList[tokenID].token);
        path[1] = address(tokenList[tokenID].pairedToken);
        uint256[] memory estimates = router.getAmountsOut(tokenAmount, path);
        
        // Normalize the estimate into token decimals
        uint256 estimate = estimates[estimates.length - 1]; // This is the amount of target tokens
        estimate = estimate.mul(10**tokenList[tokenID].decimals).div(10**tokenList[tokenID].pairedTokenDecimals);
        if(estimate >= tokenAmount){
            return true;
        }
        return false;
    }
    
    function findRoute(address _from, address _to, bool useETH) internal view returns (address[] memory) {
        // This will find a uniswap route between 2 tokens based on best liquidity
        address[] memory path;
        address weth = UniswapRouter(uniswapRouterAddress).WETH();
        address dsd = address(tokenList[1].token);
        address bac = address(tokenList[2].token);
        
        address fromIntermediate = tokenList[0].pairedToken;
        if(_from == dsd){
            fromIntermediate = tokenList[1].pairedToken;
        }else if(_from == bac){
            fromIntermediate = tokenList[2].pairedToken;
        }
        
        address toIntermediate = tokenList[0].pairedToken;
        if(_to == dsd){
            toIntermediate = tokenList[1].pairedToken;
        }else if(_to == bac){
            toIntermediate = tokenList[2].pairedToken;
        }
        if(_to == weth){
            // Only 3 swaps required, token, intermediate token (DAI or USDC), WETH
            path = new address[](3);
            path[0] = _from; // For example, ESD -> USDC -> WETH, or BAC -> DAI -> WETH
            path[1] = fromIntermediate;
            path[2] = weth;
        }else{
            // Token to token swaps
            if(fromIntermediate == toIntermediate){
                // Same middle token
                path = new address[](3);
                path[0] = _from; // For example, ESD -> USDC -> DSD, or DSD -> USDC -> ESD
                path[1] = fromIntermediate;
                path[2] = _to;
            }else{
                // BAC has different intermediate token then others
                if(useETH == false){
                    // 4 step process
                    path = new address[](4);
                    path[0] = _from; // For example, ESD -> USDC -> DAI -> BAC, or BAC -> DAI -> USDC -> ESD
                    path[1] = fromIntermediate;
                    path[2] = toIntermediate;
                    path[3] = _to;                     
                }else{
                    // 5 step process
                    // We can use ETH for large trades
                    path = new address[](5);
                    path[0] = _from; // For example, BAC -> DAI -> WETH -> USDC -> ESD, or DSD -> USDC -> WETH -> DAI -> BAC
                    path[1] = fromIntermediate;
                    path[2] = weth; // WETH
                    path[3] = toIntermediate;
                    path[4] = _to;
                }
            }
        }
        return path;
    }
    
    function checkAndSwapTokens(address _executor) internal {
        lastTradeTime = now;
        UniswapRouter router = UniswapRouter(uniswapRouterAddress);
        
        // Now find our target token to sell into
        uint256 targetID = getCheapestUniswapToken();
        uint256 length = tokenList.length;

        // Now sell all the other tokens into this token
        uint256 _totalBalance = balance(); // Get the token balance at this contract, should increase
        bool _expectIncrease = false;
        for(uint256 i = 0; i < length; i++){
            if(i != targetID){
                if(tradeInExpansionOnly == true){ // Optional
                    if(expansionPhase(i) == false){
                        continue; // Do not trade this token unless in expansion
                    }
                }
                uint256 localTarget = targetID;
                uint256 sellBalance = 0;
                uint256 _minTradeTarget = minTradeSplit.mul(10**tokenList[i].decimals);
                uint256 _maxTradeTarget = maxAmountSell.mul(10**tokenList[i].decimals); // Determine the maximum amount of tokens to sell at once
                if(tokenList[i].token.balanceOf(address(this)) <= _minTradeTarget){
                    // If balance is too small,sell all tokens at once
                    sellBalance = tokenList[i].token.balanceOf(address(this));
                }else{
                    sellBalance = tokenList[i].token.balanceOf(address(this)).mul(percentSell).div(divisionFactor);
                }
                if(sellBalance > _maxTradeTarget){
                    // If greater than the maximum trade allowed, match it
                    sellBalance = _maxTradeTarget;
                }
                uint256 minReceiveBalance = sellBalance.mul(10**tokenList[localTarget].decimals).div(10**tokenList[i].decimals); // Change to match decimals of destination
                if(sellBalance > 0){
                    address[] memory path = findRoute(address(tokenList[i].token), address(tokenList[localTarget].token), false);
                    uint256[] memory estimates = router.getAmountsOut(sellBalance, path);
                    uint256 estimate = estimates[estimates.length - 1];
                    if(i == 2 || localTarget == 2){
                        // We are either selling or buying BAC, determine which route is better value
                        address[] memory alt_path = findRoute(address(tokenList[i].token), address(tokenList[localTarget].token), true);
                        estimates = router.getAmountsOut(sellBalance, alt_path);
                        uint256 alt_estimate = estimates[estimates.length - 1];
                        if(alt_estimate > estimate){
                            // This path is more profitable
                            estimate = alt_estimate;
                            path = alt_path; // Change the path to this
                        }
                    }
                    if(estimate > minReceiveBalance){
                        _expectIncrease = true;
                        // We are getting a greater number of tokens, complete the exchange
                        tokenList[i].token.safeApprove(uniswapRouterAddress, 0);
                        tokenList[i].token.safeApprove(uniswapRouterAddress, sellBalance);
                        router.swapExactTokensForTokens(sellBalance, minReceiveBalance, path, address(this), now.add(60));
                    }                        
                }
            }
        }
        uint256 _newBalance = balance();
        if(_expectIncrease == true){
            // There may be rare scenarios where we don't gain any by calling this function
            require(_newBalance > _totalBalance, "Failed to gain in balance from selling tokens");
        }
        uint256 gain = _newBalance.sub(_totalBalance);
        if(gain >= minGain){
            // Minimum gain required to buy WETH is about 0.01 tokens
            
            // Buy WETH from Uniswap with tokens
            uint256 sellBalance = gain.mul(10**tokenList[targetID].decimals).div(1e18); // Convert to target decimals
            uint256 holdBalance = sellBalance.mul(percentDepositor).div(divisionFactor);
            sellBalance = sellBalance.sub(holdBalance); // We will buy WETH with this amount
            if(sellBalance <= tokenList[targetID].token.balanceOf(address(this))){
                IERC20 weth = IERC20(router.WETH());
                
                // Perform swap and sell some of our gained token for WETH
                address[] memory path = findRoute(address(tokenList[targetID].token), address(weth), false);
                tokenList[targetID].token.safeApprove(uniswapRouterAddress, 0);
                tokenList[targetID].token.safeApprove(uniswapRouterAddress, sellBalance);
                router.swapExactTokensForTokens(sellBalance, 1, path, address(this), now.add(60));
                
                uint256 _wethBalance = weth.balanceOf(address(this));
                if(_wethBalance > 0){
                    // Split the amount sent to the treasury, stakers and executor if one exists
                    if(_executor != address(0)){
                        // First send the executor a percentage of the profit
                        uint256 executorAmount = _wethBalance.mul(percentExecutor).div(divisionFactor);
                        if(executorAmount > 0){
                            weth.safeTransfer(_executor, executorAmount);
                            _wethBalance = weth.balanceOf(address(this)); // Recalculate WETH in contract                          
                        }
                    }
                    uint256 stakersAmount = _wethBalance.mul(percentStakers).div(divisionFactor);
                    uint256 treasuryAmount = _wethBalance.sub(stakersAmount);
                    if(treasuryAmount > 0){
                        weth.safeTransfer(treasuryAddress, treasuryAmount);
                    }
                    if(stakersAmount > 0){
                        if(stakingAddress != address(0)){
                            weth.safeTransfer(stakingAddress, stakersAmount);
                            StabilizeStakingPool(stakingAddress).notifyRewardAmount(stakersAmount);                                
                        }else{
                            // No staking pool selected, just send to the treasury
                            weth.safeTransfer(treasuryAddress, stakersAmount);
                        }
                    }
                }
            }
        }
    }
    
    function expectedProfit(bool inWETHForExecutor) external view returns (uint256) {
        // This view will return the amount of gain a forced swap will make on next call
        // And alternatively it can return expected WETH profit from trade for executor
        UniswapRouter router = UniswapRouter(uniswapRouterAddress);
        
        // Now find our target token to sell into
        uint256 targetID = getCheapestUniswapToken();
        uint256 length = tokenList.length;

        uint256 _normalizedGain = 0;
        for(uint256 i = 0; i < length; i++){
            if(i != targetID){
                if(tradeInExpansionOnly == true){ // Optional
                    if(expansionPhase(i) == false){
                        continue; // Do not trade this token unless in expansion
                    }
                }
                uint256 localTarget = targetID;
                uint256 sellBalance = 0;
                uint256 _minTradeTarget = minTradeSplit.mul(10**tokenList[i].decimals);
                uint256 _maxTradeTarget = maxAmountSell.mul(10**tokenList[i].decimals); // Determine the maximum amount of tokens to sell at once
                if(tokenList[i].token.balanceOf(address(this)) <= _minTradeTarget){
                    // If balance is too small,sell all tokens at once
                    sellBalance = tokenList[i].token.balanceOf(address(this));
                }else{
                    sellBalance = tokenList[i].token.balanceOf(address(this)).mul(percentSell).div(divisionFactor);
                }
                if(sellBalance > _maxTradeTarget){
                    // If greater than the maximum trade allowed, match it
                    sellBalance = _maxTradeTarget;
                }
                uint256 minReceiveBalance = sellBalance.mul(10**tokenList[localTarget].decimals).div(10**tokenList[i].decimals); // Change to match decimals of destination
                if(sellBalance > 0){
                    address[] memory path = findRoute(address(tokenList[i].token), address(tokenList[localTarget].token), false);
                    uint256[] memory estimates = router.getAmountsOut(sellBalance, path);
                    uint256 estimate = estimates[estimates.length - 1];
                    if(i == 2 || localTarget == 2){
                        // We are either selling or buying BAC, determine which route is better value
                        address[] memory alt_path = findRoute(address(tokenList[i].token), address(tokenList[localTarget].token), true);
                        estimates = router.getAmountsOut(sellBalance, alt_path);
                        uint256 alt_estimate = estimates[estimates.length - 1];
                        if(alt_estimate > estimate){
                            // This path is more profitable
                            estimate = alt_estimate;
                            path = alt_path; // Change the path to this
                        }
                    }
                    if(estimate > minReceiveBalance){
                        uint256 _gain = estimate.sub(minReceiveBalance).mul(1e18).div(10**tokenList[localTarget].decimals); // Normalized gain
                        _normalizedGain = _normalizedGain.add(_gain);
                    }                        
                }
            }
        }
        if(inWETHForExecutor == false){
            return _normalizedGain;
        }else{
            if(_normalizedGain == 0){
                return 0;
            }
            // Calculate how much WETH the executor would make as profit
            uint256 sellBalance = _normalizedGain.mul(10**tokenList[targetID].decimals).div(1e18); // Convert to target decimals
            uint256 holdBalance = sellBalance.mul(percentDepositor).div(divisionFactor);
            sellBalance = sellBalance.sub(holdBalance); // We will buy WETH with this amount
            // Estimate output
            address[] memory path = findRoute(address(tokenList[targetID].token), router.WETH(), false);
            uint256[] memory estimates = router.getAmountsOut(sellBalance, path);
            uint256 estimate = estimates[estimates.length - 1]; // This is the WETH estimate return
            return estimate.mul(percentExecutor).div(divisionFactor); // Executor amount
        }
           
    }
    
    function executorSwapTokens(address _executor, uint256 _minSecSinceLastTrade) external {
        // Function designed to promote trading with incentive. Users get 20% of WETH from profitable trades
        require(_msgSender() == tx.origin, "Contracts cannot interact with this function");
        require(now.sub(lastTradeTime) > _minSecSinceLastTrade, "The last trade was too recent");
        checkAndSwapTokens(_executor);
    }
    
    // Governance functions
    function governanceSwapTokens() external onlyGovernance {
        // This is function that force trade tokens at anytime. It can only be called by governance
        checkAndSwapTokens(governance());
    }
    
    function governanceSetExpansionRequirement(bool expandOnly) external onlyGovernance {
        // This can change the expansion only limit at anytime. It can only be called by governance
        tradeInExpansionOnly = expandOnly;
    }
    
    // Timelock variables
    
    uint256 private _timelockStart; // The start of the timelock to change governance variables
    uint256 private _timelockType; // The function that needs to be changed
    uint256 constant _timelockDuration = 86400; // Timelock is 24 hours
    
    // Reusable timelock variables
    address private _timelock_address;
    uint256 private _timelock_data_1;
    uint256 private _timelock_data_2;
    
    modifier timelockConditionsMet(uint256 _type) {
        require(_timelockType == _type, "Timelock not acquired for this function");
        _timelockType = 0; // Reset the type once the timelock is used
        if(balance() > 0){ // Timelock only applies when balance exists
            require(now >= _timelockStart + _timelockDuration, "Timelock time not met");
        }
        _;
    }
    
    // Change the owner of the token contract
    // --------------------
    function startGovernanceChange(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 1;
        _timelock_address = _address;       
    }
    
    function finishGovernanceChange() external onlyGovernance timelockConditionsMet(1) {
        transferGovernance(_timelock_address);
    }
    // --------------------
    
    // Change the treasury address
    // --------------------
    function startChangeTreasury(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 2;
        _timelock_address = _address;
    }
    
    function finishChangeTreasury() external onlyGovernance timelockConditionsMet(2) {
        treasuryAddress = _timelock_address;
    }
    // --------------------
    
    // Change the percent going to depositors for WETH
    // --------------------
    function startChangeDepositorPercent(uint256 _percent) external onlyGovernance {
        require(_percent <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 3;
        _timelock_data_1 = _percent;
    }
    
    function finishChangeDepositorPercent() external onlyGovernance timelockConditionsMet(3) {
        percentDepositor = _timelock_data_1;
    }
    // --------------------
    
    // Change the staking address
    // --------------------
    function startChangeStakingPool(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 4;
        _timelock_address = _address;
    }
    
    function finishChangeStakingPool() external onlyGovernance timelockConditionsMet(4) {
        stakingAddress = _timelock_address;
    }
    // --------------------
    
    // Change the zsToken address
    // --------------------
    function startChangeZSToken(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 5;
        _timelock_address = _address;
    }
    
    function finishChangeZSToken() external onlyGovernance timelockConditionsMet(5) {
        zsTokenAddress = _timelock_address;
    }
    // --------------------
    
    // Change the percent going to stakers for WETH
    // --------------------
    function startChangeStakersPercent(uint256 _percent) external onlyGovernance {
        require(_percent <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 6;
        _timelock_data_1 = _percent;
    }
    
    function finishChangeStakersPercent() external onlyGovernance timelockConditionsMet(6) {
        percentStakers = _timelock_data_1;
    }
    // --------------------
    
    // Change the percent sold and max sellable of each token
    // --------------------
    function startChangePercentAndAmountSold(uint256 _percent, uint256 _maxSell) external onlyGovernance {
        require(_percent <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 7;
        _timelock_data_1 = _percent;
        _timelock_data_2 = _maxSell;
    }
    
    function finishChangePercentAndAmountSold() external onlyGovernance timelockConditionsMet(7) {
        percentSell = _timelock_data_1;
        maxAmountSell = _timelock_data_2;
    }
    // --------------------
    
    // Change percent of balance to trigger trade
    // --------------------
    function startChangePercentTradeTrigger(uint256 _percent) external onlyGovernance {
        require(_percent <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 8;
        _timelock_data_1 = _percent;
    }
    
    function finishChangePercentTradeTrigger() external onlyGovernance timelockConditionsMet(8) {
        percentTradeTrigger = _timelock_data_1;
    }
    // --------------------
    
    // Change the minimum trade size before splitting, otherwise sells entire amount
    // --------------------
    function startChangeMinTradeSplit(uint256 _split) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 9;
        _timelock_data_1 = _split;
    }
    
    function finishChangeMinTradeSplit() external onlyGovernance timelockConditionsMet(9) {
        minTradeSplit = _timelock_data_1;
    }
    // --------------------
    
    // Change the maximum amount of tokens allowed in this strategy
    // --------------------
    function startChangeMaximumPoolSize(uint256 _amount) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 10;
        _timelock_data_1 = _amount;
    }
    
    function finishChangeMaximumPoolSize() external onlyGovernance timelockConditionsMet(10) {
        maxPoolSize = _timelock_data_1;
    }
    // --------------------
}