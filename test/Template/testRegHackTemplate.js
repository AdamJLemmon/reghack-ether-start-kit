var RegHackTemplate = artifacts.require('./RegHackTemplate.sol');

contract('RegHackTemplate', function(accounts) {

	// Test the helloHacker method returns correct and triggers event
	it('RegHackTemplate should return hello <name> and trigger the hello event method invoked', function() {
		return RegHackTemplate.new().then(function(instance) {
			return instance.helloHacker('adam')

		// Once the transaction has mined
		}).then(function(result){
			console.log(result);

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
				'Hello event not present in the logs, was not fired'
			);
		});
	});
});
