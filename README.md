## Installation

Provide code examples and explanations of how to get the project.

Prerequisites:
1. npm
2. nodejs

Install:
1. [Node-Scrypt](https://www.npmjs.com/package/scrypt)
```
$ npm install -g node-gyp
$ npm install scrypt
```
2. [ethtestrpc](https://github.com/ethereumjs/testrpc)
```
$ npm install -g ethereumjs-testrpc
```
3. [Truffle](http://truffleframework.com/docs/getting_started/installation)
```
$ npm install -g truffle
```

4. [Solidity](http://solidity.readthedocs.io/en/develop/installing-solidity.html)
```
$ npm install -g solc
```

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.


## Development Quick Start
*Once install steps are complete*

### Development and Testing
#### Truffle
1. Start testrpc
```
$ testrpc
EthereumJS TestRPC v3.0.5

Available Accounts
==================
(0) 0x914f40d4609b5d710cf28b8fcf2df4feb153252f
(1) 0x0f75c318dbd176d13d356bff7b2546e2a1f143e6
(2) 0x47f50566c22304c4c2b8cb198f6b927c2467537b
(3) 0xb2f6b4817105e87e8c49cd08eb62c39ad1215527
(4) 0xfd7a5fde345935f1c7ad5db2a172a0b9ef2d301e
(5) 0x1ede49f9062b82114f8652c86608c65b17cffe22
(6) 0x4beeb98bf1d9c01de9a34225210a8c9f0b253495
(7) 0x00316d9cd29c42fe6dfde665b2103b81342fa582
(8) 0x6fe440f6a36317d36f0c05bd05d04a97799ca59f
(9) 0x120c254a382f8bcf378e5f114b89476f4b90dafc

Private Keys
==================
(0) ec8742affb5f597464ac12a6e1a3747e338377991f2f8320cb0170c789bd8069
(1) a15d82fd1b21146eba781cb39a9ae46b25b6d59dea0860ec5b4216bccc2e9220
(2) 0e95c4185457a07fceb7c8c4f201039ec0415714dc033ad85f12124f8327929e
(3) 85811894c9df849e2f82cb3c778d1f22f0978c64679ee991b76ad6efab023dc4
(4) 82d081135768130290ef74b439faa18fc9ffeaa058d5dc7ea39257b2f3b16d8b
(5) 0ddd432289661c383f69c84eea169141b59c8a1a9ba7ca7f2faf37a071e38651
(6) df205db07437606c8a31ef29fd0fc6ce2b786b1e717d5ae1bf011242854418a5
(7) f22134d066d88e0d6430492246369f8c1d8eb772d3e2c50094a67c3f86b2adde
(8) 630e99657655266ed7d4019f55603e6156047565ce834a21b044285bb5e4e39a
(9) ed0763d32a3c402698fa45887bff31c2ed22553f7fabb674c64792a92e46f05a

HD Wallet
==================
Mnemonic:      smoke suspect diary notice beef thumb alien salad include crazy hurt fly
Base HD Path:  m/44'/60'/0'/0/{account_index}

Listening on localhost:8545
```

2. Create truffle project
```
$ cd <pathToCreateProject>
$ mkdir regHackDownUnder
$ cd regHackDownUnder
regHackDownUnder$ truffle init
Downloading project...
Project initialized.

  Documentation: http://truffleframework.com/docs

Commands:

  Compile: truffle compile
  Migrate: truffle migrate
  Test:    truffle test
```

3. Run the example contract tests
```
regHackDownUnder$ truffle test
Using network 'development'.

Compiling ./contracts/ConvertLib.sol...
Compiling ./contracts/MetaCoin.sol...
Compiling ./test/TestMetacoin.sol...
Compiling truffle/Assert.sol...
Compiling truffle/DeployedAddresses.sol...


  TestMetacoin
    ✓ testInitialBalanceUsingDeployedContract (112ms)
    ✓ testInitialBalanceWithNewMetaCoin (127ms)

  Contract: MetaCoin
    ✓ should put 10000 MetaCoin in the first account (64ms)
    ✓ should call a function that depends on a linked library (83ms)
    ✓ should send coin correctly (158ms)


  5 passing (1s)
```

*Great you are all setup and ready to start writing and testing your own solidity code!*
*Have a look around the folders created for you at this point*
*Note I have removed the example tests and contracts that were provided*
*Below is an example to write and test your own contract via truffle*
4. Create a javascript test
```
regHackDownUnder$ cd test
test$ mkdir RegHackTemplate // will be the name of the contract
test$ cd RegHackTemplate
RegHackTemplate$ touch testRegHackTemplate.js
RegHackTemplate$ vim testRegHackTemplate.js
var RegHackTemplate = artifacts.require('./RegHackTemplate.sol');

contract('RegHackTemplate', function(accounts) {

    // Test the helloHacker method returns correct and triggers event
    it('RegHackTemplate should return hello <name> and trigger the hello event method invoked', function() {
        return RegHackTemplate.new().then(function(instance) {
            return instance.helloHacker('adam')

        // Once the transaction has mined
        }).then(function(result){
            let logs = result.logs;
            let eventFound = false;

            // Iterate over logs and see if the Hello event was fired
            for (var i = 0; i < logs.length; i++) {
                if (logs[i].event == 'Hello'){
                    eventFound = true;
                }
            }

            assert(
                eventFound, 
                'Hello even not present in the logs, was not fired'
            );
        });
    });
});
```

*Note the test fails nicely of course.*
```
regHackDownUnder$ truffle test
Error: Could not find /home/adam/Desktop/regHackDownUnder/contracts/RegHackTemplate.sol from any sources
..... and so on
```
*So let's create it.*

5. Create the **contract!**, fun part
```
regHackDownUnder$ cd contracts/
contracts$ touch RegHackTemplate.sol
contracts$ vim RegHackTemplate.sol


```


#### Remix (Browser Solidity)

### Deployment
3. Exectue initial migration
```
regHackDownUnder$ truffle migrate
Compiling ./contracts/ConvertLib.sol...
Compiling ./contracts/MetaCoin.sol...
Compiling ./contracts/Migrations.sol...
Writing artifacts to ./build/contracts

Using network 'development'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  Migrations: 0xa06a5239051ef7d4beca83fa25f3e61d82f568d8
Saving successful migration to network...
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying ConvertLib...
  ConvertLib: 0x4ee22ae42d45f8cdbdaeaa1135d71263106dab99
  Linking ConvertLib to MetaCoin
  Deploying MetaCoin...
  MetaCoin: 0x5fe3e084ad16c46b74d15aa934443ddbc1e39de0
Saving successful migration to network...
Saving artifacts...
```

## Tests

Describe and show how to run the tests with code examples.

*Default to development network*
```
$ cd /<path>/projectDirector/
$ truffle test
$ truffle test ./<path>/testFile.js
```
To specify the network
```
truffle test --network production
```

## Usage

How to use the application.

## Contributors

Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.

## License

A short snippet describing the license (MIT, Apache, etc.)