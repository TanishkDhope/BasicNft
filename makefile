-include .env
 

 create:
	forge create src/MoodNft.sol:MoodNft --rpc-url $(LOCAL_RPC) --private-key $(LOCAL_PRIVATE_KEY) --broadcast  