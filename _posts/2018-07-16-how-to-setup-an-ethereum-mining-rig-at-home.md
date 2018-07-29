---
title: "How to setup an Ethereum mining rig at home"
layout: single
classes: wide
tags: [blockchain, mining, Ethereum]

excerpt: "This post is about setting up a small blockchain mining rig at home."

header:
  image: /assets/images/bitcoin.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

toc: false
toc_label:
toc_icon:

permalink:
published: true
categories: 
---

Here in this post I've briefly discussed about the hardware and software requirements for setting up your own ethereum mining
rig at home. 
The hardware recommended is for a small 6-GPU mining rig which can be easily scaled up for a multinode system as well.
One can configure the hardware to mine any of the common cryptocurrencies(I've mined Ether here). 
 

# Blockchain Mining

Mining refers to the distributed computational review process performed on each "block" of data in a "block-chain". 
This allows for achievement of consensus in an environment where neither party knows or trusts each other.

**Bitcoin blockchain:** The process of adding and verifying new transaction records to the bitcoin blockchain (distributed public ledger), which includes all past transactions. 
During this process, new bitcoins are released from the remaining unmined pool of 21 million total bitcoins.

**Ethereum:** allows a network of peers to administer their own ‘smart contracts’ – short computer programmes that execute their instructions once certain criteria have been met.
Ethereum’s big innovation is that it runs Turing-complete smart contracts, applications that rely on if-then scenarios to execute specific terms of an agreement.
Ethereum was invented by Vitalik Buterin and announced in early 2014.

**Ripple:** Distributed ledger are validated by consensus rather than using a proof-of-work approach like Bitcoin because a level of trust is assumed between the parties to a transaction.


# Hardware recommendation for Setting up a Mining Rig

### 6 X Graphics Cards(GPUs)
RX Radeon 480/470 4GB RAM
Memory Types: HYNIX, ELPIDA, SAMSUNG, MICRON 
Serial number:
Hynix A1637, A1640,  A1648, A1630, A1715
Elpida A1641, A1637, A1638, A1643, A1712
Samsung A1645, A1636, A1647, A1700, A1650, A1639, A1644, A1706
Micron A1610, A1701, A1707, A1702
*A1637 and A1641 may also be a Samsung


### 1 X Motherboard/CPU Combination
motherboard with 6 x16 PCIe slots
Asrock/Biostar
ASRock Z97 Anniversary LGA 1150 Motherboard 	|  Intel Celeron G1840 Processor  
ASRock ATX H97 Anniversary Edition Motherboard  |  Intel Celeron G1840 Processor  
MSI Z97 Intel LGA 1150 Gaming Motherboard 		|  Intel Celeron G1840 Processor  
Asrock H61 Pro BTC Motherboard					|  Intel Celeron G1840 Processor  
Asrock H81 Pro BTC Motherboard 					|  Intel Celeron G1840 Processor  
Asrock B85 Anniversary Motherboard 				|  Intel Celeron G1840 Processor  
Gigabyte F2A88X-D3H Motherboard 				|  AMD Athlon X4 860k Processor


### 1 X Power Supply
EVGA SuperNOVA 1200 P2 of 1200W
500W X2 - sonic/zebronics(cheap)


### 1 x RAM(System Memory)
4GB DDR3 1600Mhz RAM


### 1x to 16x Powered Riser Cables(6 pack) 
PCI Express 1X to 16X Powered Riser Cables


### 1x Hard Drive(SSD)
Solid State Drive 32GB


### OS - Linux
Ubuntu


### Mining Software
Claymore or Geth	


# Steps to build an Ethereum mining rig

> Install graphic drivers > cuda or openCL package > microsoft Redistributables > install ethereum wallet > install Geth > download Ethereum’s blockchain > install Ethminer  > build the DAG > start mining

1. Install Ubuntu 16.04 and the AMD Driver
2. Install the Ethereum Software
3. Benchmark and start mining
4. Motherboard Settings
5. Fan and temperature: control and monitoring
6. Overclocking and custom BIOS


# A few pointers to start with
- http://www.coinminingrigs.com/how-to-build-a-6-gpu-mining-rig/
- https://whattomine.com/
- https://www.coingecko.com/
- http://www.blockchaintechnologies.com/
- https://coinmarketcap.com/
- https://shapeshift.io/
- http://www.coinwarz.com/cryptocurrency


# Ethereum Tools & Terminologies
**Geth:** This is the Go implementation of an Ethereum node, and is the basis for any interactions with the Ethereum blockchain. Running this locally will allow you to easily interact with the Ethereum blockchain. Read the go-ethereum installation instructions.
geth is the the command line interface for running a full ethereum node implemented in Go.
- can take part in the ethereum frontier live network
- mine real ether
- transfer funds between addresses
- create contracts and send transactions
- explore block history

**Mist:** This is the equivalent of a web browser, but for the Ethereum platform. It acts as a GUI to display the accounts and contracts that you interact with. It also allows you to create and interact with contracts in a graphical user interface without ever touching the command line. If you are not a developer and just want to store ether and interact with Ethereum contracts, then Mist is the program to use. 

**Ethminer:** A standalone miner. This can be used to mine or benchmark a mining set-up. It is compatible with eth, geth, and pyethereum. 

**Mix:** The integrated development environment for DApp authoring. Quickly prototype and debug decentralised applications on the Ethereum platform.

