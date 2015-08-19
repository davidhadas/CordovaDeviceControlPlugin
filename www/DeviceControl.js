module.exports = {
    clear: function(success, error) {
        console.log('DeviceControl inside clear');
        cordova.exec(success, error, "DeviceControl", "clear", []);
    },
    displayDimensions: function(success, error) {
        console.log('DeviceControl inside displayDimensions');
        cordova.exec(success, error, "DeviceControl", "displayDimensions", []);
    }
}
