module.exports = {
    displayDimensions: function(success, error) {
        //console.log('DeviceControl inside displayDimensions');
        cordova.exec(success, error, "DeviceControl", "displayDimensions", []);
    }
}
