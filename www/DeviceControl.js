module.exports = function () {
    
    this.init = function(success, error) {
        //console.log('SpeechRecognitionPlugin: init');
        this.success = success;
        this.error = error;
    };

    this.displayDimensions = function() {
        //console.log('SpeechRecognitionPlugin: start');
        return cordova.exec(this.success, this.error, "DeviceControl", "displayDimensions", []);
    };

}
