const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const{interface, bytecode} = require('./compile');

const provider = new HDWalletProvider(
  'stock minor alert orbit prison split camp artefact grain hood reduce crawl',
  'https://rinkeby.infura.io/jKYonabl7i1PExNawl8D'
);
const web3 = new Web3(provider);

const deploy = async ()=>{
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
  .deploy({data: '0x' + bytecode}) //no arguments for the lottery project
  .send({from: accounts[0]});

  console.log('Contract deployed to', result.options.address);
}; //only reason to create this function is to use async
deploy();
