// Example Solidity code for TWAP
contract TWAP {
    uint256[] public prices;
    uint256 public period = 1 hours;
    uint256 public lastUpdate;

    function updatePrice(uint256 newPrice) public {
        if (block.timestamp >= lastUpdate + period) {
            prices.push(newPrice);
            lastUpdate = block.timestamp;
        }
    }

    function getAveragePrice() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < prices.length; i++) {
            sum += prices[i];
        }
        return sum / prices.length;
    }
}
