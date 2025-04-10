-- Query to get monad testnet block level data between March 1ST 2025 and March 31ST 2025
SELECT BLOCK_NUMBER, BLOCK_HASH, BLOCK_TIMESTAMP, TX_COUNT
FROM monad.testnet.fact_blocks
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for the total number of block created on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT COUNT(BLOCK_NUMBER) AS TOTAL_NUMBER_OF_BLOCK_CREATED
FROM monad.testnet.fact_blocks
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for maxium transaction count in a block on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT MAX(TX_COUNT) AS highest_transaction_count
FROM monad.testnet.fact_blocks
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for blocks created corressponding to highest transaction count on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT BLOCK_NUMBER,TX_COUNT
FROM monad.testnet.fact_blocks
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'
 AND TX_COUNT IN(SELECT DISTINCT TX_COUNT FROM monad.testnet.fact_blocks
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'
ORDER BY TX_COUNT DESC
LIMIT 1)
ORDER BY TX_COUNT

-- Query to get monad testnet transaction data between March 1ST 2025 and March 31ST 2025
SELECT BLOCK_NUMBER, BLOCK_TIMESTAMP, TX_HASH, FROM_ADDRESS, TX_FEE_PRECISE, TX_SUCCEEDED
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query to get the unique number of wallet addresss that interacted on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT COUNT(DISTINCT FROM_ADDRESS) AS number_of_addresses_interacted
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query to get total number of transactions done on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT COUNT(TX_HASH) AS total_number_of_transactions
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for the number of failed transactios on the monad testnet between martch 1ST 2025 to March 31ST 2025
SELECT COUNT(TX_HASH) AS number_of_failed_transactions
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'AND TX_SUCCEEDED = 'FALSE'

-- Query for the number of succeessful transactios on the monad testnet between martch 1ST 2025 to March 31ST 2025
SELECT COUNT(TX_HASH) AS number_of_transactions_succeeded
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'AND TX_SUCCEEDED = 'TRUE'

-- Query for total transaction fee on monad testnet in between March 1ST 2025 to March 31ST 2025
SELECT SUM(TX_FEE) AS total_transaction_fee
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for maximum transaction fee on monad testnet in between March 1ST 2025 to March 31ST 2025
SELECT MAX(TX_FEE) AS maximum_trasaction_fee
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for minimum transaction fee on monad testnet in between March 1ST 2025 to March 31ST 2025
SELECT MIN(TX_FEE) AS minimum_transaction_fee
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query for average transaction fee on monad testnet in between March 1ST 2025 to March 31ST 2025
SELECT AVG(TX_FEE) AS average_transaction_fee
FROM monad.testnet.fact_transactions
WHERE BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Query to get monad testnet contract deployment level data between March 1ST 2025 and March 32ST 2025
SELECT ADDRESS, CREATED_BLOCK_NUMBER, CREATED_BLOCK_TIMESTAMP, CREATED_TX_HASH, CREATOR_ADDRESS
FROM monad.testnet.dim_contracts
WHERE CREATED_BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Total number of smart contracts deployed on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT COUNT(CREATED_TX_HASH)
FROM monad.testnet.dim_contracts
WHERE CREATED_BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

-- Total number of unique wallet addresses that deployed smart contracts on monad testnet between March 1ST 2025 to March 31ST 2025
SELECT COUNT(DISTINCT CREATOR_ADDRESS) AS number_of_contract_creators
FROM monad.testnet.dim_contracts
WHERE CREATED_BLOCK_TIMESTAMP BETWEEN '2025-03-01 00:00:00.000' AND '2025-03-31 11:59:00.00'

